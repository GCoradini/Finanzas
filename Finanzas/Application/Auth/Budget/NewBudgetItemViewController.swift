//
//  NewBudgetItemViewController.swift
//  Finanzas
//
//  Created by Usuario on 11/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class NewBudgetItemViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var typePicker: UIPickerView!
    let transactionTypes = ["Income", "Expense"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New transaction"
        datePicker.datePickerMode = .date
        typePicker.dataSource = self
        typePicker.delegate = self
    }
    
    @IBAction func acceptBtn() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewBudgetItemViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return transactionTypes[row]
    }
}

extension NewBudgetItemViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transactionTypes.count
    }
}
