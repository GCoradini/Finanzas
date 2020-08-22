//
//  Filter.swift
//  Finanzas
//
//  Created by Usuario on 21/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

extension TransactionManager {
    
    func filterByTitle(title: String) {
        var titleTransactions:[Transaction] = []
        for transaction in transactions {
            if transaction.title.lowercased().contains(title.lowercased()) {
                titleTransactions.append(transaction)
            }
        }
        transactions = titleTransactions
    }
    
    func filterIncome() {
        var incomeTransactions:[Transaction] = []
        for transaction in transactions {
            if transaction.type == .Income {
                incomeTransactions.append(transaction)
            }
        }
        transactions = incomeTransactions
    }
    
    func filterExpense() {
        var expenseTransactions:[Transaction] = []
        for transaction in transactions {
            if transaction.type == .Expense {
                expenseTransactions.append(transaction)
            }
        }
        transactions = expenseTransactions
    }
}
