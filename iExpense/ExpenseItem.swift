//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/5/24.
//

import Foundation

enum currencyType: String, CaseIterable, Codable {
    case USD = "USD"
    case RUB = "CNY"
    case EUR = "EUR"
}

struct ExpenseItem: Identifiable, Codable {
    var id: UUID =  UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: currencyType
}
