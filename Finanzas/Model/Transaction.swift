//
//  Transaction.swift
//  Finanzas
//
//  Created by Usuario on 12/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

enum TransactionType : String, Codable {
    case Income
    case Expense
}

struct Transaction : Codable {
    var amount: String
    var title: String
    var date: Date
    var type: TransactionType
    var description: String
    
    init(
        amount: String,
        title: String,
        date: Date,
        type: TransactionType,
        description: String
    ) {
        self.amount = amount
        self.title = title
        self.date = date
        self.type = type
        self.description = description
    }
    
    func getDescription() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString + "\nType: " + type.rawValue + "\nDescription: " + description + "\n" + "$" + amount
    }
}
