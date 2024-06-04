//
//  AddView.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/5/24.
//

import SwiftUI
enum expanseType: String, CaseIterable  {
    case Business = "Business"
    case Personal = "Personal"
}

struct AddView: View {
    @State private var name: String = ""
    @State private var type: expanseType = .Business
    @State private var amount: Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            
                Picker("Type", selection: $type) {
                    ForEach(expanseType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: ""))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type.rawValue, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
           
        }
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
