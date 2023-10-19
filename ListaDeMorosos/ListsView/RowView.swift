//
//  RowView.swift
//  ListaDeMorosos
//
//  Created by Alex Ros on 09/10/2023.
//

import SwiftUI

struct RowView: View {
    @Environment(\.colorScheme) var colorScheme
    var moroso: MorosoModel
    
    var body: some View {
        HStack {
            moroso.avatar.resizable().frame(width: 30, height: 30).padding()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 4))
            Text(moroso.name).font(.title3).padding(.horizontal)
            Spacer()
            Text("\(moroso.debt.description)€").bold().foregroundColor(.red).padding(.horizontal)
        }
    }
}

#Preview {
    RowView(moroso: MorosoModel(id: 1, name: "Marta", debt: 6.15, avatar: Image(systemName: "person.fill")))
}
