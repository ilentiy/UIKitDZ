//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var hidePass = false
    @IBOutlet weak var hidePassButton: UIButton!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidePassButton.addTarget(self, action: #selector(hidePassAction), for: .touchUpInside)
    }
    @IBAction func hidePassAction(_ sender: Any) {
        if hidePass {
            hidePass = false
            passTextField.isSecureTextEntry = false
        } else {
            hidePass = true
            passTextField.isSecureTextEntry = true
        }
    }
}
