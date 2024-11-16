//
//  ConversionTable.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//


import Foundation
import SwiftUI

struct ConversionTable {
    // Define unit categories
    static let weightUnits: [String] = [
        "milligram",
        "gram",
        "kilogram",
        "ounce",
        "pound"
    ]

    static let volumeUnits: [String] = [
        "milliliter",
        "liter",
        "cup",
        "pint",
        "quart",
        "gallon",
        "fluid ounce",
        "tablespoon",
        "teaspoon"
    ]

    static let eachUnits: [String] = [
        "bag",
        "each",
        "piece",
        "item"
    ]

    
    // Base conversion factors for weight and volume units
    static let weightConversions: [String: Double] = [
        // Milligram conversions
        "milligramToGram": 0.001,
        "milligramToKilogram": 0.000001,
        "milligramToOunce": 0.000035274,
        "milligramToPound": 0.00000220462,
        
        // Gram conversions
        "gramToMilligram": 1000,
        "gramToKilogram": 0.001,
        "gramToOunce": 0.035274,
        "gramToPound": 0.00220462,
        
        // Kilogram conversions
        "kilogramToMilligram": 1_000_000,
        "kilogramToGram": 1000,
        "kilogramToOunce": 35.274,
        "kilogramToPound": 2.20462,
        
        // Ounce conversions
        "ounceToMilligram": 28_349.5,
        "ounceToGram": 28.3495,
        "ounceToKilogram": 0.0283495,
        "ounceToPound": 0.0625,
        
        // Pound conversions
        "poundToMilligram": 453_592,
        "poundToGram": 453.592,
        "poundToKilogram": 0.453592,
        "poundToOunce": 16
    ]

    static let volumeConversions: [String: Double] = [
        // Milliliter conversions
        "milliliterToLiter": 0.001,
        "milliliterToCup": 0.00422675,
        "milliliterToPint": 0.00211338,
        "milliliterToQuart": 0.00105669,
        "milliliterToGallon": 0.000264172,
        "milliliterToFluidOunce": 0.033814,
        "milliliterToTablespoon": 0.067628,
        "milliliterToTeaspoon": 0.202884,
        
        // Liter conversions
        "literToMilliliter": 1000,
        "literToCup": 4.22675,
        "literToPint": 2.11338,
        "literToQuart": 1.05669,
        "literToGallon": 0.264172,
        "literToFluidOunce": 33.814,
        "literToTablespoon": 67.628,
        "literToTeaspoon": 202.884,
        
        // Cup conversions
        "cupToMilliliter": 236.588,
        "cupToLiter": 0.236588,
        "cupToPint": 0.5,
        "cupToQuart": 0.25,
        "cupToGallon": 0.0625,
        "cupToFluidOunce": 8,
        "cupToTablespoon": 16,
        "cupToTeaspoon": 48,
        
        // Pint conversions
        "pintToMilliliter": 473.176,
        "pintToLiter": 0.473176,
        "pintToCup": 2,
        "pintToQuart": 0.5,
        "pintToGallon": 0.125,
        "pintToFluidOunce": 16,
        "pintToTablespoon": 32,
        "pintToTeaspoon": 96,
        
        // Quart conversions
        "quartToMilliliter": 946.353,
        "quartToLiter": 0.946353,
        "quartToCup": 4,
        "quartToPint": 2,
        "quartToGallon": 0.25,
        "quartToFluidOunce": 32,
        "quartToTablespoon": 64,
        "quartToTeaspoon": 192,
        
        // Gallon conversions
        "gallonToMilliliter": 3785.41,
        "gallonToLiter": 3.78541,
        "gallonToCup": 16,
        "gallonToPint": 8,
        "gallonToQuart": 4,
        "gallonToFluidOunce": 128,
        "gallonToTablespoon": 256,
        "gallonToTeaspoon": 768,
        
        // Fluid Ounce conversions
        "fluidOunceToMilliliter": 29.5735,
        "fluidOunceToLiter": 0.0295735,
        "fluidOunceToCup": 0.125,
        "fluidOunceToPint": 0.0625,
        "fluidOunceToQuart": 0.03125,
        "fluidOunceToGallon": 0.0078125,
        "fluidOunceToTablespoon": 2,
        "fluidOunceToTeaspoon": 6,
        
        // Tablespoon conversions
        "tablespoonToMilliliter": 14.7868,
        "tablespoonToLiter": 0.0147868,
        "tablespoonToCup": 0.0625,
        "tablespoonToPint": 0.03125,
        "tablespoonToQuart": 0.015625,
        "tablespoonToGallon": 0.00390625,
        "tablespoonToFluidOunce": 0.5,
        "tablespoonToTeaspoon": 3,
        
        // Teaspoon conversions
        "teaspoonToMilliliter": 4.92892,
        "teaspoonToLiter": 0.00492892,
        "teaspoonToCup": 0.0208333,
        "teaspoonToPint": 0.0104167,
        "teaspoonToQuart": 0.00520833,
        "teaspoonToGallon": 0.00130208,
        "teaspoonToFluidOunce": 0.166667,
        "teaspoonToTablespoon": 0.333333
    ]

    
    let allUnits = Array(weightUnits)
    + Array(volumeUnits)
    + Array(eachUnits)
    
    
    let firstUnit = weightUnits.first!
    
    // Function to get a conversion factor between compatible units
    static func conversionFactor(from fromUnit: String, to toUnit: String) throws -> Double {
        // Check if units are known
        guard weightUnits.contains(fromUnit) || volumeUnits.contains(fromUnit) || eachUnits.contains(fromUnit) else {
            throw ConversionError.unknownUnit(unit: fromUnit)
        }
        guard weightUnits.contains(toUnit) || volumeUnits.contains(toUnit) || eachUnits.contains(toUnit) else {
            throw ConversionError.unknownUnit(unit: toUnit)
        }
        
        // Ensure units are in the same category
        if (weightUnits.contains(fromUnit) && weightUnits.contains(toUnit)) ||
            (volumeUnits.contains(fromUnit) && volumeUnits.contains(toUnit)) {
            let key = "\(fromUnit)To\(toUnit)"
            if let factor = weightConversions[key] ?? volumeConversions[key] {
                return factor
            } else {
                throw ConversionError.conversionNotFound(fromUnit: fromUnit, toUnit: toUnit)
            }
        } else {
            throw ConversionError.incompatibleUnits(fromUnit: fromUnit, toUnit: toUnit)
        }
    }
}
