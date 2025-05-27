//
//  EditItemView.swift
//  SwiftData-Optionals
//
//  Created by Remo Prozzillo on 27.05.2025.
//


import Foundation
import SwiftUI

struct EditItemView: View {
    @Environment(\.dismiss) var dismiss
    /// Pass the item to this View
    @Bindable var item: Item
    
    var body: some View {
        List {
            Section {
                // withDefault because the name is optional and it needs a default value
              TextField("Name", text: $item.name.withDefault(value: ""))
            } header: {
                Text("Edit Item")
            }
            
            Button("Close", systemImage: "xmark", action: {
                // close the sheet
                dismiss()
            })
        } // List
        .navigationTitle(item.name ?? "")
    }
}

//#Preview {
//    @Previewable @State var item = Item(name: "test123")
//    NavigationStack {
//        ItemEditView(item: item)
//    }
//}
