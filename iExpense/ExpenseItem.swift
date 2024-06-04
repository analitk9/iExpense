//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/5/24.
//

import Foundation


struct ExpenseItem: Identifiable, Codable {
    var id: UUID =  UUID()
    let name: String
    let type: String
    let amount: Double
}
