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
    var validations: Validations<TransactionErrors>
    
    init(){
        userDefault = UserDefaultManager()
        validations = Validations()
    }
    
    func addNewTransaction(
        transactionTitle: String?,
        transactionAmount: String?,
        transactionType: TransactionType,
        transactionDate: Date,
        transactionDescription: String?,
        user: String
    ) -> [TransactionErrors] {
 
        if let title = transactionTitle,
            let amount = transactionAmount,
            let description = transactionDescription
        {
            if title.isEmpty {
                validations.addError(error: .titleEmpty)
            }
            
            if !amount.isValidAmount {
                validations.addError(error: .invalidAmount)
            }
            
            if description.isEmpty {
                validations.addError(error: .descriptionEmpty)
            }

            if validations.errors.isEmpty {
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
        return validations.errors
    }
    
    func clearErrors() {
        validations.clearErrors()
    }
    
    func getBalance(user: String) -> Double {
        let transactions = userDefault.getTransactions(user: user)
        var balance: Double = 0
        
        for transaction in transactions {
            if let amount = Double(transaction.amount) {
                balance += transaction.type == TransactionType.Income ? amount : -amount
            }
        }
        return balance
    }
    
    func getTransactions(user: String) -> [Transaction] {
        return userDefault.getTransactions(user: user)
    }
}
