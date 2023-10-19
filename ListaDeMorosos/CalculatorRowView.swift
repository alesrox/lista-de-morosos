//
//  CalculatorRowView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 11/10/2023.
//

import SwiftUI

struct CalculatorRowView: View {
    @Environment(\.colorScheme) var colorScheme
    @Bindable var moroso: Moroso
    var aux: Float
    var minus: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill").resizable().frame(width: 30, height: 30).padding()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 4))
            VStack {
                Text(moroso.name).font(.title3).padding(.horizontal)
                Text("\(moroso.debt.description)€").bold().foregroundColor(.red).padding(.horizontal)
            }
            Spacer()
            if minus {
                Button(action: {
                    moroso.debt -= aux
                    moroso.debt = round(moroso.debt * 100) / 100
                }) {
                    Image(systemName: "minus.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.red)
                }.padding()
            } else {
                Button(action: {
                    moroso.debt += aux
                    moroso.debt = round(moroso.debt * 100) / 100
                }) {
                    Image(systemName: "plus.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.green)
                }.padding()
            }
        }

    }
}

/*#Preview {
    CalculatorRowView()
}*/
