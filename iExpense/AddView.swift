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
    @State private var name: String = "enter name of expanse"
    @State private var type: expanseType = .Business
    @State private var currency: currencyType = .EUR
    @State private var amount: Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
           Form {
             //   TextField("Name", text: $name)
                Text("Type of expanse")
                Picker("Type", selection: $type) {
                    ForEach(expanseType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                Text("Type of currency")
                Picker("Type of currency", selection: $currency) {
                    ForEach(currencyType.allCases, id: \.self) { type in
                        Text(type.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                TextField("Amount", value: $amount, format: .currency(code: "\(currency.rawValue)"))
                    .keyboardType(.decimalPad)
          }
           .navigationBarBackButtonHidden()
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name,
                                           type: type.rawValue,
                                           amount: amount,
                                           currency: currency)
                  //  print(amount)
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
