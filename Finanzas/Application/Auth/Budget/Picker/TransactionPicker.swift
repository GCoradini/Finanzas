//
//  TransactionPicker.swift
//  Finanzas
//
//  Created by Usuario on 13/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueSelected = transactionTypes[row]
    }
}
