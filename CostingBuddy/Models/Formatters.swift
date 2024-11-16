//
//  Formatters.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//


import SwiftUI
import Combine

class Formatters: ObservableObject {
    let decimalF: NumberFormatter
    let currencyF: NumberFormatter
    let percentF: NumberFormatter
    
    init() {
        // Decimal Formatter
        decimalF = NumberFormatter()
        decimalF.numberStyle = .decimal
        decimalF.maximumFractionDigits = 2
        decimalF.minimumFractionDigits = 0
        
        // Currency Formatter
        currencyF = NumberFormatter()
        currencyF.numberStyle = .currency
        currencyF.currencyCode = "USD" // Set currency code as needed
        
        // Percent Formatter
        percentF = NumberFormatter()
        percentF.numberStyle = .percent
        percentF.maximumFractionDigits = 1
        
    }
}
