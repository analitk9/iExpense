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
    private var busness: [ExpenseItem] {
        expenses.items.filter { item in
            item.type == "Business"
        }
    }
    private var personal: [ExpenseItem] {
        expenses.items.filter { item in
            item.type == "Personal"
        }
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("busness") {
                    ForEach(busness) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                          
                            Text(item.amount, format: .currency(code: item.currency.rawValue)).tag(item.id)
                               .foregroundStyle(returnColor(item.amount))
                        }
                    }
                    .onDelete(perform: removeItemBusiness)
                }
                Section("personal") {
                    ForEach(personal) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                          
                            Text(item.amount, format: .currency(code: item.currency.rawValue)).tag(item.id)
                               .foregroundStyle(returnColor(item.amount))
                        }
                    }
                    .onDelete(perform: removeItemPersonal)
                }
           
            }
            
            .navigationTitle("IExpense")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .navigationDestination(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
//        .sheet(isPresented: $showingAddExpense) {
//           AddView(expenses: expenses)
//        }
    }
    
    private func returnColor(_ amount: Double)-> Color {
        switch amount {
            case 0..<11:
                    return Color.green
            case 11..<101:
                return Color.yellow
            case 100...:
                return Color.red
            default:
                return Color.black
        }
    }
    
    private func removeItemPersonal(at offsets: IndexSet) {
        if let indx = offsets.first {
            let itemId = personal[indx].id
            expenses.items.removeAll { item in
                item.id == itemId
            }
        }
        
    }
    
    private func removeItemBusiness(at offsets: IndexSet) {
        if let indx = offsets.first {
            let itemId = busness[indx].id
            expenses.items.removeAll { item in
                item.id == itemId
            }
        }
    }

}


#Preview {
    ContentView()
}
