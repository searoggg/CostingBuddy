//
//  CostingBuddyApp.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//



import SwiftUI
import SwiftData

@main
struct CostingBuddyApp: App {
    
    @StateObject private var dataModel = SharedDataModel()
    @StateObject private var formatters = Formatters()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
                .environmentObject(formatters)
                .frame(minWidth: 800, idealWidth: 800, maxWidth: .infinity, minHeight: 600, idealHeight: 1000, maxHeight: .infinity)
            
        }
        .windowResizability(.contentSize)
    }
}
