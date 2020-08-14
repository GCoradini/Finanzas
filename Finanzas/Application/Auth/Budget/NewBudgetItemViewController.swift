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
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var typePicker: UIPickerView!
    @IBOutlet var titleTF: UITextField!
    @IBOutlet var amountTF: UITextField!
    @IBOutlet var descriptionTV: UITextView!
    @IBOutlet var titleErrorLbl: UILabel!
    @IBOutlet var amountErrorLbl: UILabel!
    @IBOutlet var descriptionErrorLbl: UILabel!
    
    // MARK: - Attributes -
    let transactionTypes = ["Income", "Expense"]
    let transactionManager = TransactionManager()
    var valueSelected: String = "Income"
    var userLogued: String = ""
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New transaction"
        datePicker.datePickerMode = .date
        typePicker.dataSource = self
        typePicker.delegate = self
    }
    
    // MARK: - Init -
    convenience init(username: String) {
        self.init()
        self.userLogued = username
    }
    
    // MARK: - Add Transaction Action -
    @IBAction func acceptBtn() {
        let validations = transactionManager.addNewTransaction(
            transactionTitle: titleTF.text,
            transactionAmount: amountTF.text,
            transactionType: valueSelected,
            transactionDate: datePicker.date,
            transactionDescription: descriptionTV.text,
            user: userLogued
            )
        
        guard !validations.contains(false) else {
            if validations[0] {
                titleErrorLbl.clearErrorMessage()
            } else {
                titleErrorLbl.setErrorMessage(message: "title is empty")
            }
            
            if validations[1] {
                amountErrorLbl.clearErrorMessage()
            } else {
                amountErrorLbl.setErrorMessage(message: "amount is not valid")
            }
            
            if validations[2] {
                descriptionErrorLbl.clearErrorMessage()
            } else {
                descriptionErrorLbl.setErrorMessage(message: "description is empty")
            }
            return
        }
        titleErrorLbl.clearErrorMessage()
        amountErrorLbl.clearErrorMessage()
        descriptionErrorLbl.clearErrorMessage()
        self.navigationController?.popViewController(animated: true)
    }
}
