//
//  NewMorosoView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 09/10/2023.
//

import SwiftUI
import SwiftData

struct NewMorosoView: View {
    @Environment(\.modelContext) var modelContext
    @FocusState private var isFocused: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var inputName: String = ""
    @State var inputDebt: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "person.fill").resizable().frame(width: 160, height: 160).padding()
                .clipShape(Circle()).overlay(Circle().stroke(Color.black, lineWidth: 4))
                .shadow(color: Color.gray, radius: 5)
            Divider().padding()
            
            TextField("Marta", text: $inputName).padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
                .foregroundColor(.white)
                .padding(.bottom, 5)
                .padding(.horizontal, 20)
                .focused($isFocused)
            
            TextField("0.00", text: $inputDebt).keyboardType(.decimalPad).padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10)
                .foregroundColor(.white)
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
                .focused($isFocused)
            
            Button(action: {
                let newMoroso = Moroso(name: inputName, debt: (inputDebt.replacingOccurrences(of: ",", with: ".") as NSString).floatValue, avatar: Image(systemName: "person.fill"))
                modelContext.insert(newMoroso)
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                Image(systemName: "paperplane.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.white)
            }
            .frame(width: 100, height: 30).padding(20)
            .background(Color.blue).cornerRadius(20)
            Spacer()
        }.padding()
            .toolbar {
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

#Preview {
    NewMorosoView()
}
