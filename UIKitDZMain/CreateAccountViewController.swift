//
//  CreateAccountViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 23.09.2022.
//

import UIKit

/// Регистация аккаунта
class CreateAccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func billAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить чек?", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "чек", style: .default) {_ in
            let getBill = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = getBill.instantiateViewController(
                withIdentifier: "Bill") as? BillViewController else { return }
            self.show(viewController, sender: nil)
        }
        let cancelAction = UIAlertAction(title: "отмена", style: .cancel)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
}
