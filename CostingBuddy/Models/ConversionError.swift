//
//  ConversionError.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//


// ErrorTypes.swift

enum ConversionError: Error, CustomStringConvertible {
    case incompatibleUnits(fromUnit: String, toUnit: String)
    case unknownUnit(unit: String)
    case conversionNotFound(fromUnit: String, toUnit: String)
    
    var description: String {
        switch self {
        case .incompatibleUnits(let fromUnit, let toUnit):
            return "Cannot convert between incompatible units: \(fromUnit) and \(toUnit)."
        case .unknownUnit(let unit):
            return "Unknown unit: \(unit)."
        case .conversionNotFound(let fromUnit, let toUnit):
            return "No conversion factor found between \(fromUnit) and \(toUnit)."
        }
    }
}
