//
//  TransactionTableViewCell.swift
//  Finanzas
//
//  Created by Usuario on 12/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    // MARK: - Views -
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var amountLbl: UILabel!
    @IBOutlet var typeLbl: UILabel!
    
    // MARK: - Attributes -
    static let height: CGFloat = 50.0
    
    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Cell Configure -
    func configure(with transaction: Transaction) {
        titleLbl.text = transaction.title
        amountLbl.text = "$" + transaction.amount.description
        typeLbl.text = transaction.type.rawValue
    }
    
}
