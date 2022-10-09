//
//  UIViewController + Extension.swift
//  UIKitDZMain
//
//  Created by Илья on 09.10.2022.
//

import UIKit

/// extension  добавляет AlertController
extension UIViewController {
    
    // MARK: - Private Methods
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: .none)
        alert.addAction(action)
        present(alert, animated: true, completion: .none)
    }
}
