//
//  SharedDataModel.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//




import SwiftUI
import Combine


class SharedDataModel: ObservableObject {

    @Published var ingredients: [Ingredient] = []
    @Published var recipes: [Recipe] = []
    @Published var allergenType: [String] = [
        "Milk",
        "Eggs",
        "Fish",
        "Shellfish",
        "Tree nuts",
        "Peanuts",
        "Wheat",
        "Soybeans",
        "Sesame"
    ]
   
    // You might add other shared state or methods here as needed
}

