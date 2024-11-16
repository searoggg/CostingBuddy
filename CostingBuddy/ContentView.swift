//
//  ContentView 2.swift
//  CostingBuddy
//
//  Created by Chris Rogers on 11/15/24.
//



import Foundation
import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var dataModel: SharedDataModel
    @EnvironmentObject var formatters: Formatters
   
    
    
    var body: some View {
        NavigationSplitView {
            
            
            VStack{
                
                NavigationLink {
                     IngredientList()
                        .environmentObject(dataModel)
                        .environmentObject(formatters)
                        
                } label: {
                    Text("Ingredients")
                        .font(.headline)
                }.padding()
                
                NavigationLink {
                    RecipeList()
                        .environmentObject(dataModel)
                        .environmentObject(formatters)
                } label: {
                    Text("Recipes")
                        .font(.headline)
                }
            }
            .padding(.top, 50)
            Spacer()
                .border(Color.red)
            
            
            
            
            
                .navigationSplitViewColumnWidth(min: 180, ideal: 200, max:200)
            
        } detail: {
            Text("Select Ingredient or Recipe")
        }
       
    }
}
    

#Preview {
    ContentView()
        .environmentObject(SharedDataModel())
        .environmentObject(Formatters())
 
    
}
