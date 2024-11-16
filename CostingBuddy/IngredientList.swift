//
//  IngredientList.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//


import Foundation
import SwiftUI

struct IngredientList: View {
    @EnvironmentObject var dataModel: SharedDataModel
    @EnvironmentObject var formatters: Formatters

    @State private var showingAddIngredient = false
    @State private var selectedIngredient: Ingredient? = nil
    @State private var showDeleteConfirmation = false
    @State private var ingredientToDelete: Ingredient?

    var body: some View {
        NavigationStack {
            VStack {
                // Add Ingredient button at the top
                Button(action: addIngredient) {
                    Text("Add Ingredient")
                        .foregroundColor(.blue)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
                .padding([.leading, .trailing, .top])

                // List of ingredients with delete and edit buttons
                List {
                    ForEach(dataModel.ingredients) { ingredient in
                        HStack {
                            // Display ingredient name
                            Text(ingredient.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding(.trailing)

                            // NavigationLink for editing the ingredient
                            NavigationLink(destination: IngredientDetailView(ingredient: binding(for: ingredient))
                                .environmentObject(dataModel)
                                .environmentObject(formatters)) {
                                Text("Edit")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.blue)
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.trailing, 5)

                            // Delete button with trash icon
                            Button(action: {
                                ingredientToDelete = ingredient
                                showDeleteConfirmation = true
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.white)
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.red)
                                    )
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.trailing)
                        }
                        .padding()
                    }
                }
                .navigationTitle("Ingredients")
            }
            .alert(isPresented: $showDeleteConfirmation) {
                Alert(
                    title: Text("Delete Ingredient"),
                    message: Text("Are you sure you want to delete this ingredient?"),
                    primaryButton: .destructive(Text("Delete")) {
                        deleteIngredient()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }


    private func addIngredient() {
        let newIngredient = Ingredient(
            name: "Unnamed Ingredient",
            unitsPurchased: 0.0,
            unitType: ConversionTable.weightUnits.first!,
            purchaseCost: 0.0,
            convUnit: ConversionTable.weightUnits.first!,
            convWeightValue: 0.0,
            convWeightUnit: ConversionTable.weightUnits.first!,
            weightConversionFactor: nil,
            displayWeightPercentage: 100.0,
            usableWeightPercentage: 100.0,
            allergens: [],
            notes: ""
        )
        dataModel.ingredients.append(newIngredient)
        selectedIngredient = newIngredient
    }
    
    private func deleteIngredient() {
        if let ingredientToDelete = ingredientToDelete,
           let index = dataModel.ingredients.firstIndex(where: { $0.id == ingredientToDelete.id }) {
            dataModel.ingredients.remove(at: index)
        }
    }

    private func binding(for ingredient: Ingredient) -> Binding<Ingredient> {
        guard let index = dataModel.ingredients.firstIndex(where: { $0.id == ingredient.id })
        else {
            fatalError("Ingredient not found")
        }
        return $dataModel.ingredients[index]
    }
}

#Preview {
    IngredientList()
        .environmentObject(SharedDataModel())
        .environmentObject(Formatters())
}

