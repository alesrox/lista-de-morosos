//
//  SettingsView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 10/10/2023.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var morosos: [Moroso]
    
    @Binding var darkTheme: Bool
    @State var showAlert: Bool = false
    
    func delete() {
        morosos.forEach {
            modelContext.delete($0)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Text("Hello, World!")
                
                Toggle(isOn: $darkTheme) {
                    Text("Dark Mode")
                }
                
                HStack {
                    Text("Vaciar morosos").foregroundColor(.red)
                    Spacer()
                    Button(action: {
                        showAlert = true
                    }) {
                        Image(systemName: "trash.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(.red)
                    }.alert(isPresented: $showAlert, content: {
                        Alert(title: Text("¿Seguro que quieres eliminar todos los morosos?"),
                              message: Text("Esta acción es irreversible"),
                              primaryButton: 
                                Alert.Button.default(Text("Aceptar"), action: {delete()}),
                              secondaryButton: .destructive(Text("Cancelar"))
                        )
                    })
                        
                }
            }.preferredColorScheme(darkTheme ? .dark : .light)
        }.navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(darkTheme: .constant(false))
}
