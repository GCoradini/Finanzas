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
    @IBOutlet private var table: UITableView!
    @IBOutlet private var userLbl: UILabel!
    @IBOutlet private var balanceLbl: UILabel!
    
    // MARK: - Attributes -
    private var transactions:[Transaction] = []
    private var transactionManager = TransactionManager()
    private var userLogged = User()
    private var login = Login()
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        userLbl.text = userLogged.username
        self.title = "Budget"
        
        addNavigationButtons()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        balanceLbl.text = String(transactionManager.getBalance(user: userLogged.username))
        transactions = transactionManager.getTransactions(user: userLogged.username)
        table.reloadData()
    }
    
    // MARK: - Navigation Buttons -
    private func addNavigationButtons() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add new",
            style: .done,
            target: self,
            action: #selector(addNew)
        )
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
    }
    
    // MARK: - Logout -
    @objc func logout() {
        login.logout()
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table Configuration -
    private func configureTableView() {
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
        
        table.delegate = self
        table.dataSource = self
    }
    
    // MARK: - Init -
    convenience init(user: User) {
        self.init()
        self.userLogged = user
    }
        
    // MARK: - New Transaction Action -
    @objc func addNew() {
        let view = NewBudgetItemViewController(username: userLogged.username)
        self.navigationController?.pushViewController(view, animated: true)
    }
}

// MARK: - UITableViewDataSource -
extension BudgetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as! TransactionTableViewCell
        let transaction = transactions[indexPath.row]
        cell.configure(with: transaction)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TransactionHeader") as! TransactionHeader
        return header
    }
}

// MARK: - UITableViewDelegate -
extension BudgetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TransactionTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TransactionHeader.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transaction = transactions[indexPath.row]
        self.alert(
            message: "\(transaction.getDescription())" ,
            title: transaction.title,
            handler: nil
        )
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
