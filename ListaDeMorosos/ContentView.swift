//
//  ContentView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 09/10/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {    
    var body: some View {
        TabView {
            ListView().tabItem {
                Image(systemName: "list.bullet.clipboard.fill")
                Text("Morosos")
            }
            CalculatorView().tabItem {
                Image(systemName: "number.square")
                Text("Calculadora")
            }
        }
    }
}

#Preview {
    ContentView()
}
