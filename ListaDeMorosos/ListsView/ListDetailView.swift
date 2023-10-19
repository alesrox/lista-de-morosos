//
//  ListDetailView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 09/10/2023.
//

import SwiftUI

struct ListDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var input: String = ""
    
    @Environment(\.modelContext) var modelContext
    @Bindable var moroso: Moroso
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "person.fill").resizable().frame(width: 160, height: 160).padding()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 4))
                .shadow(color: Color.gray, radius: 5)
            Divider().padding()
            
            Text(moroso.name).font(.largeTitle).bold()
            
            Text("\(moroso.debt.description) €").font(.title3).bold().foregroundColor(.red)
            HStack {
                TextField("€€€", text: $input).keyboardType(.decimalPad).padding(10)
                    .background(LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? [Color.white, Color.white] : [Color.gray, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 10)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .focused($isFocused)
                
                Button(action: {
                    moroso.debt += (input.replacingOccurrences(of: ",", with: ".") as NSString).floatValue
                    moroso.debt = round(moroso.debt * 100) / 100
                }) {
                    Image(systemName: "plus.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.green)
                }
                
                Button(action: {
                    moroso.debt -= (input.replacingOccurrences(of: ",", with: ".") as NSString).floatValue
                    moroso.debt = round(moroso.debt * 100) / 100
                }) {
                    Image(systemName: "minus.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.red)
                }
            }.padding()
    
            HStack {
                Button(action: {
                    moroso.debt = 0
                }) {
                    Image(systemName: "archivebox.circle.fill").resizable().frame(width: 40, height: 40).foregroundColor(Color.white)
                }
                .frame(width: 100, height: 30).padding(20)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing)).cornerRadius(20)
                
                Button(action: {
                    modelContext.delete(moroso)
                }) {
                    Image(systemName: "trash.circle.fill").resizable().frame(width: 40, height: 40).foregroundColor(Color.white)
                }
                .frame(width: 100, height: 30).padding(20)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)).cornerRadius(20)
            }.padding()
            Spacer()
        }.padding()
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Button(action: {
                        isFocused = false
                    }, label: {
                        Image(systemName: "keyboard.chevron.compact.down").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    })
                }
            }
    }
}

/*#Preview {
    ListDetailView(moroso: Moroso(name: "Marta", debt: 8.15, avatar: Image(systemName: "person.fill")))
}*/
