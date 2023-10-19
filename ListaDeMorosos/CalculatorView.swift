//
//  CalculatorView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 09/10/2023.
//

import SwiftUI
import SwiftData

struct CalculatorView: View {
    @Environment(\.modelContext) var modelContext
    @Query var morosos: [Moroso]
    
    @State private var numberOfPeople: Int = 0
    @State private var amount: String = ""
    
    let tipPercentages: [Float] = [0.0, 0.1, 0.2, 0.25]
    @State private var tipPercentage: Float = 0.0
    
    @State private var showMorosos: Bool = false
    @State private var minus: Bool = false
    @FocusState private var isFocused: Bool
    
    var tip: Float {
        let amountP: Float = (amount.replacingOccurrences(of: ",", with: ".") as NSString).floatValue
        
        return amountP * tipPercentage
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("$0.00", text: $amount).keyboardType(.decimalPad).focused($isFocused)
                        Picker("Number of People", selection: $numberOfPeople) {
                            ForEach(2..<11) {
                                Text("\($0) people")
                            }
                        }
                    }.toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button(action: {
                                isFocused = false
                            }, label: {
                                Image(systemName: "keyboard.chevron.compact.down").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            })
                        }
                    }
                    
                    Section {
                        Picker("Tip Percentages", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }.pickerStyle(.segmented)
                        Text(tip, format: .currency(code: "EUR"))

                    } header: {
                        Text("How much tip do you want leave?")
                    }
                    
                    List {
                        Text(((amount.replacingOccurrences(of: ",", with: ".") as NSString).floatValue)/Float(numberOfPeople + 2), format: .currency(code: "EUR"))
                        Toggle(isOn: $showMorosos) {
                            Text("Show Morosos")
                        }
                        if showMorosos {
                            Toggle(isOn: $minus) {
                                Text("Minus")
                            }
                        }
                    }
                    
                    if showMorosos {
                        List {
                            ForEach(morosos) { moroso in
                                CalculatorRowView(moroso: moroso, aux: ((amount.replacingOccurrences(of: ",", with: ".") as NSString).floatValue)/Float(numberOfPeople + 2), minus: minus)
                            }
                        }
                    }
                }.toolbar {
                    ToolbarItem {
                        Button(action: {
                            isFocused = false
                        }) {
                            Image(systemName: "keyboard.chevron.compact.down").resizable().frame(width: 25, height: 25).padding().foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
}

/*#Preview {
    CalculatorView()
}*/
