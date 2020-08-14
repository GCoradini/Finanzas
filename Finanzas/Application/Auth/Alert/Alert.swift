//
//  Alert.swift
//  Finanzas
//
//  Created by Usuario on 09/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

extension UIViewController {

    func alert(
        message: String,
        title: String = "",
        handler: ((UIAlertAction) -> Void)? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let OKAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: handler
        )
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
  }
}
