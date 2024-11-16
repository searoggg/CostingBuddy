//
//  RecipeList.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//


import Foundation
import SwiftUI


struct RecipeList: View {
    @EnvironmentObject var dataModel: SharedDataModel
    @EnvironmentObject var formatters: Formatters
    
    @State private var showingAddRecipe = false
    @State private var selectedRecipe: Recipe? = nil
    @State private var showDeleteConfirmation = false
    @State private var recipetoDelete: Recipe?
    
    var body: some View {
        VStack{
            
            Text("Recipe List")
                .font(.headline)
                .padding()
            Text("Placeholder")
                .font(.headline)
                .padding()
                
            
        }.frame(minWidth: 200, idealWidth: 1000)
    }
    
}
