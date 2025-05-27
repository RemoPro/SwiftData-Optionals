//
//  AddItemView.swift
//  SwiftData-Optionals
//
//  Created by Remo Prozzillo on 27.05.2025.
//


import Foundation
import SwiftUI
import SwiftData

struct AddItemView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var item = Item(name: "")
    
    var body: some View {
        List {
            Section {
                TextField("Name", text: $item.name.withDefault(value: ""))
                
            } header: {
                Text("New Item")
            }
            
            Section {
                Button("Save", systemImage: "square.and.arrow.down", action: {
                    modelContext.insert(item)
                    dismiss()
                })
            }
        } // List
    }
}

//#Preview {
//    AddItemView()
//}
