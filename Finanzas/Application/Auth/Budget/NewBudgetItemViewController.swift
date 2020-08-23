//
//  NewBudgetItemViewController.swift
//  Finanzas
//
//  Created by Usuario on 11/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class NewBudgetItemViewController: UIViewController {

    // MARK: - Views -
    @IBOutlet private var datePicker: UIDatePicker!
    @IBOutlet private var typePicker: UIPickerView!
    @IBOutlet private var titleTF: UITextField!
    @IBOutlet private var amountTF: UITextField!
    @IBOutlet private var descriptionTV: UITextView!
    @IBOutlet private var titleErrorLbl: UILabel!
    @IBOutlet private var amountErrorLbl: UILabel!
    @IBOutlet private var descriptionErrorLbl: UILabel!
    
    // MARK: - Attributes -
    private let transactionTypes = ["Income", "Expense"]
    private let transactionManager = TransactionManager()
    private var valueSelected = TransactionType.Income
    private var userLogged: String = ""
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New transaction"
        configureDatePicker()        
    }
        
    // MARK: - Init -
    convenience init(username: String) {
        self.init()
        self.userLogged = username
    }
    
    // MARK: - Date Picker Configuration -
    func configureDatePicker() {
        datePicker.datePickerMode = .date
        typePicker.dataSource = self
        typePicker.delegate = self
    }
    
    // MARK: - Add Transaction Action -
    @IBAction func acceptBtn() {
        let validations = transactionManager.addNewTransaction(
            transactionTitle: titleTF.text,
            transactionAmount: amountTF.text,
            transactionType: valueSelected,
            transactionDate: datePicker.date,
            transactionDescription: descriptionTV.text,
            user: userLogged
            )
        clearErrors()
        
        for error in validations {
            switch error {
            case .titleEmpty:
                titleErrorLbl.setErrorMessage(message: "title is empty")
            case .descriptionEmpty:
                descriptionErrorLbl.setErrorMessage(message: "description is empty")
            case .invalidAmount:
                amountErrorLbl.setErrorMessage(message: "amount is not valid")
            case .saveError:
                self.alert(
                    message: "Can´t save the transaction" ,
                    title: "Save Error",
                    handler: {_ in self.navigationController?.popViewController(animated: true)}
                )
            }
        }
        
        if !validations.isEmpty {
            transactionManager.clearErrors()
            return
        }
        clearErrors()
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Clear errors -
    private func clearErrors() {
        titleErrorLbl.clearErrorMessage()
        amountErrorLbl.clearErrorMessage()
        descriptionErrorLbl.clearErrorMessage()
    }
}

// MARK: - UIPickerViewDelegate -
extension NewBudgetItemViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return transactionTypes[row]
    }
}

// MARK: - UIPickerViewDataSource -
extension NewBudgetItemViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transactionTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueSelected = transactionTypes[row] == "Income" ? .Income : .Expense
    }
}
