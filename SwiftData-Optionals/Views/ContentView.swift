//
//  ContentView.swift
//  SwiftData-Optionals
//
//  Created by Remo Prozzillo on 27.05.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.name) var items: [Item]
    @State private var showSheetAddItem = false
    @State private var showSheetEditItem = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    /// Show "" when no value exists is only for the compiler as the item couldn't be shown anyway as the ForEach would show nothing.
                    Text(item.name ?? "")
                        .contextMenu {
                            Button("Edit", systemImage: "pencil", action: {
                                showSheetEditItem = true
                            })
                            
                            // Delete
                            Button(role: .destructive) {
                                modelContext.delete(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        } //contextMenu
                        .sheet(isPresented: $showSheetEditItem) {
                            EditItemView(item: item)
#if os(macOS)
                                .frame(height: 150)
#endif
                        } // sheet
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button("Add new Item", systemImage: "plus", action: {
                        showSheetAddItem = true
                    })
                }
            } // toolbar
            .sheet(isPresented: $showSheetAddItem) {
                AddItemView()
#if os(macOS)
                    .frame(height: 150)
#endif
            } // sheet
        }
    }
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
