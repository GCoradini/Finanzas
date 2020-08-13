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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with transaction: Transaction) {
        titleLbl.text = transaction.title
        amountLbl.text = "$" + transaction.amount.description
        typeLbl.text = transaction.type
    }
    
}
