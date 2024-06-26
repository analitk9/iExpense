//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Denis Evdokimov on 6/4/24.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ExpenseItem.self)
        }
    }
}
