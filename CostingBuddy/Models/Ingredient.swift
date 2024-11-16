//
//  Ingredient.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//


import Foundation
import SwiftData

struct Ingredient: Identifiable, Hashable {
    
    var id = UUID()
    var name: String
    var unitsPurchased: Double
    var unitType: String
    var purchaseCost: Double
    var convUnit: String
    var convWeightValue: Double
    var convWeightUnit: String
    var weightConversionFactor: Double?
    var displayWeightPercentage: Double
    var usableWeightPercentage: Double
    var allergens: [String]
    var notes: String

    // Computed properties
    
    
    var usasbleWeightPercentage: Double {
        return displayWeightPercentage / 100
    }
    
    var perUnitCost: Double {
        return purchaseCost / unitsPurchased
    }

    var adjustedCostPerUnit: Double {
        guard let weightConversionFactor = weightConversionFactor else {
            return perUnitCost * usableWeightPercentage / 100
        }
        return (perUnitCost / weightConversionFactor) * usableWeightPercentage / 100
    }
}
