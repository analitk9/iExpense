//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/5/24.
//

import Foundation
import SwiftData

enum currencyType: String, CaseIterable, Codable {
    case USD = "USD"
    case RUB = "CNY"
    case EUR = "EUR"
}

@Model
class ExpenseItem {
    var id: UUID =  UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: currencyType
    init( name: String, type: String, amount: Double, currency: currencyType) {
     
        self.name = name
        self.type = type
        self.amount = amount
        self.currency = currency
    }
    
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case type
//        case amount
//        case currency
//    }
}
