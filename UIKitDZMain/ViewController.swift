//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Авторизация пользователя
final class ViewController: UIViewController {
    
    @IBOutlet weak var hidePassButton: UIButton!
    @IBOutlet weak var passTextField: UITextField!
    
    var isHidePass = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    @IBAction func hidePassAction(_ sender: Any) {
        if isHidePass {
            isHidePass = false
            passTextField.isSecureTextEntry = false
        } else {
            isHidePass = true
            passTextField.isSecureTextEntry = true
        }
    }
    func addTarget() {
        hidePassButton.addTarget(self, action: #selector(hidePassAction), for: .touchUpInside)
    }
}
