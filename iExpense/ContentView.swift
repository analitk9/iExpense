//
//  ContentView.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/4/24.
//

import SwiftUI




struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("IExpense")
            .toolbar(content: {
                Button("Add", systemImage: "plus") {
                    showingAddExpense = true
                }
            })
        }
        .sheet(isPresented: $showingAddExpense) {
           AddView(expenses: expenses)
        }
    }
    
    private func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


#Preview {
    ContentView()
}