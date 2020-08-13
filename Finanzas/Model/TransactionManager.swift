//
//  TransactionManager.swift
//  Finanzas
//
//  Created by Usuario on 12/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

class TransactionManager {
    var userDefault: UserDefaultManager
    
    init(){
        userDefault = UserDefaultManager()
    }
    
    func addNewTransaction(
        transactionTitle: String?,
        transactionAmount: String?,
        transactionType: String,
        transactionDate: Date,
        transactionDescription: String?,
        user: String
    ) -> [Bool] {
        var validations:[Bool] = []
        
        if let title = transactionTitle,
            let amount = transactionAmount,
            let description = transactionDescription
        {
            validations.append(!title.isEmpty)
            validations.append(amount.isValidAmount)
            validations.append(!description.isEmpty)

            if !validations.contains(false) {
                userDefault.saveTransaction(
                    Transaction(
                        amount: amount,
                        title: title,
                        date: transactionDate,
                        type: transactionType,
                        description: description
                    ),
                    user: user
                )
            }
        }
        return validations
    }
    
    func getBalance(user: String) -> Double {
        let transactions = userDefault.getTransactions(user: user)
        var balance: Double = 0
        
        for transaction in transactions {
            if let amount = Double(transaction.amount) {
                balance += transaction.type == "Income" ? amount : -amount
            }
        }
        return balance
    }
    
    func getTransactions(user: String) -> [Transaction] {
        return userDefault.getTransactions(user: user)
    }
}
