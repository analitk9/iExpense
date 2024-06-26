//
//  ListItemView.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/26/24.
//

import SwiftUI
import SwiftData

struct ListItemView: View {
    
    @Query var items: [ExpenseItem]
    @Environment(\.modelContext) var modelContext
    
    private var nameSection = ""
    
    init(type: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        if  type != "All" {
            nameSection = type
            _items = Query(filter: #Predicate<ExpenseItem> { item in

           return  item.type == type
            }, sort: sortOrder)
        } else {
            _items = Query(sort: sortOrder)
            nameSection = "All"
        }
        
    }
    
    var body: some View {
        List {
            Section(nameSection) {
                ForEach(items) { item in
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
                .onDelete(perform: removeItem)
            }
            
        }
        
      
    }
    
    private func removeItem(at offsets: IndexSet) {
        if let indx = offsets.first {
            let item = items[indx]

            modelContext.delete(item)
        }
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
}

#Preview {
    ListItemView(type: "All", sortOrder: [SortDescriptor(\ExpenseItem.name)])
}
