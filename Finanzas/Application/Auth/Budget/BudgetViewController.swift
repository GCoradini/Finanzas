//
//  BudgetViewController.swift
//  Finanzas
//
//  Created by Usuario on 11/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Budget"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Add new",
            style: .done,
            target: self,
            action: #selector(addNew)
        )
    }
    
    @objc func addNew() {
        self.navigationController?.pushViewController(NewBudgetItemViewController(), animated: true)
    }
}
