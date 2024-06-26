//
//  ContentView.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/4/24.
//

import SwiftUI
import SwiftData



struct ContentView: View {

    
    @Environment(\.modelContext) var modelContext
    
    @Query(filter: #Predicate<ExpenseItem> { item in
        if item.type == "Business" {
            return true
        } else {
            return false
        }
       
    }) var busness: [ExpenseItem]
    
    @Query(filter: #Predicate<ExpenseItem> { item in
        if item.type == "Personal" {
            return true
        } else {
            return false
        }
       
    }) var personal: [ExpenseItem]
    

    @State private var showingAddExpense = false
    
    @State private var sortOrder = 0
    
    @State private var type : String = "All"
    
    private  var sorts = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]
    
    private var types = ["All", "Business","Personal"]

    var body: some View {
        
        NavigationStack {
            ListItemView(type: type, sortOrder: [sorts[sortOrder]])
                .navigationTitle("IExpense")
                .toolbar {
                    Menu("Sort", systemImage: "arrow.up.arrow.down")  {
                        Button("Add", systemImage: "plus") {
                            showingAddExpense = true
                        }
                        Picker("order", selection: $sortOrder) {
                            ForEach(0..<2, id: \.self) { num in
                                Text("\(num == 0  ? "имя" : "число")")
                            }
                        }
                        Picker("sort", selection: $type) {
                            ForEach(types, id: \.self) { type in
                                Text(type)
                            }
                        }
                    }
                }
                .navigationDestination(isPresented: $showingAddExpense) {
                    AddView()
                }
        }
        

    }
    
//    private func returnColor(_ amount: Double)-> Color {
//        switch amount {
//            case 0..<11:
//                return Color.green
//            case 11..<101:
//                return Color.yellow
//            case 100...:
//                return Color.red
//            default:
//                return Color.black
//        }
//    }
    
//    private func removeItemPersonal(at offsets: IndexSet) {
//        if let indx = offsets.first {
//            //            let itemId = personal[indx].id
//            //            expenses.items.removeAll { item in
//            //                item.id == itemId
//            modelContext.delete(personal[indx])
//        }
//    }
//    
//    
//    
//    private func removeItemBusiness(at offsets: IndexSet) {
//        if let indx = offsets.first {
//            //            let itemId = busness[indx].id
//            //            expenses.items.removeAll { item in
//            //                item.id == itemId
//            modelContext.delete(busness[indx])
//        }
//    }
}


    





#Preview {
    ContentView()
}

