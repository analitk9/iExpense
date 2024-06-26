//
//  Expenses.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/5/24.
//

import Foundation

//@Observable
//class Expenses: Codable {
//    var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults().setValue(encoded, forKey: "items")
//            }
//        }
//    }
//    
//    init() {
//        if let data = UserDefaults().data(forKey: "items"),
//           let items = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
//            self.items = items
//            return
//        }
//       
//    }
//    
//}
