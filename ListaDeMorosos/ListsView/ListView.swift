//
//  ListView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 09/10/2023.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @AppStorage("darkTheme") var darkTheme: Bool = false
    @Environment(\.modelContext) var modelContext
    @Query var morosos: [Moroso]
    
    @State private var searchText: String = ""
    
    private var filteredMorosos: [Moroso] {
        let results = morosos
        
        if searchText.isEmpty {
            return results
        }
        
        return results.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: NewMorosoView()) {
                        Image(systemName: "pencil.circle.fill").resizable().frame(width: 40, height: 40).padding(5).padding(.horizontal, 20).foregroundColor(.green)
                    }
                }
                
                List {
                    ForEach(filteredMorosos) { moroso in
                        NavigationLink(destination: ListDetailView(moroso: moroso)) {
                            RowView(moroso: MorosoModel(id: 1, name: moroso.name, debt: moroso.debt, avatar: Image(systemName: "person.fill")))
                        }
                    }
                    //RowView(moroso: MorosoModel(id: 1, name: "moroso", debt: 200, avatar: Image(systemName: "person.fill")))
                }
                .navigationTitle("Morosos")
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search by name: Marta"
                )
                .toolbar {
                    ToolbarItem {
                        NavigationLink(destination: SettingsView(darkTheme: $darkTheme)) {
                            Image(systemName: "accessibility.fill").resizable().frame(width: 25, height: 25).padding().foregroundColor(.gray)
                        }
                    }
                }
                
            }
        }.preferredColorScheme(darkTheme ? .dark : .light)
    }
}

#Preview {
    ListView()
}
