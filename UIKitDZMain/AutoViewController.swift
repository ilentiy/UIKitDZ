//
//  AutoViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 05.10.2022.
//

import UIKit

/// Авторизация пользователя
final class AutoViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var loginTextField: UITextField!
    
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userData()
    }
    
    // MARK: - Private Methods
    private func userData() {
        if let user = UserDefaults.standard.object(forKey: "userInfo") as? [String: String] {
            loginTextField.text = user["login"]
            passwordTextField.text = user["password"]
        }
    }
    
    // MARK: - IBActions
    @IBAction func registrationButtonAction(_ sender: Any) {}
    
    @IBAction func signinButtonAction(_ sender: Any) {
        guard let user = UserDefaults.standard.object(forKey: "userInfo") as? [String: String] else { return }
        if loginTextField.text == user["login"],
           passwordTextField.text == user["password"] {
            guard let nextScreen = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MainView")
                    as? MainViewController else { return }
            nextScreen.modalPresentationStyle = .fullScreen
            self.show(nextScreen, sender: nil)
        } else {
            showAlert(title: "Предупреждение", message: "Пользователь не найден")
        }
    }
}
/// UITextFieldDelegate
extension AutoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            return false
        }
        return true
    }
}
