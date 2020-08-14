//
//  BudgetViewController.swift
//  Finanzas
//
//  Created by Usuario on 11/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {

    // MARK: - Views -
    @IBOutlet var table: UITableView!
    @IBOutlet var userLbl: UILabel!
    @IBOutlet var balanceLbl: UILabel!
    
    // MARK: - Attributes -
    var transactions:[Transaction] = []
    var transactionManager = TransactionManager()
    var userLogued: String = ""
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        userLbl.text = userLogued
        self.title = "Budget"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add new",
            style: .done,
            target: self,
            action: #selector(addNew)
        )
        table.delegate = self
        table.dataSource = self
        table.register(
            UINib(
                nibName: "TransactionTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "TransactionTableViewCell"
        )
        table.register(
            UINib(
                nibName: "TransactionHeader",
                bundle: nil
            ),
            forHeaderFooterViewReuseIdentifier: "TransactionHeader"
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        balanceLbl.text = String(transactionManager.getBalance(user: userLogued))
        transactions = transactionManager.getTransactions(user: userLogued)
        table.reloadData()
    }
    
    // MARK: - Init -
    convenience init(username: String) {
        self.init()
        self.userLogued = username
    }
    
    // MARK: - New Transaction Action -
    @objc func addNew() {
        let view = NewBudgetItemViewController(username: userLogued)
        self.navigationController?.pushViewController(view, animated: true)
    }
}
