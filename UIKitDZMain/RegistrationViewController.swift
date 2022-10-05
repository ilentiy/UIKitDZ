//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Visual Components
    
    @IBOutlet weak var regDataView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    // MARK: - Property
    var defaults = UserDefaults.standard
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        notifications()
    }
    
    // MARK: - Private Methods
    private func notifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { _ in
            self.regDataView.frame.origin.y = 200
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: nil) { _ in
            self.regDataView.frame.origin.y = 300
        }
    }
    
    // MARK: - IBAction
    @IBAction func registrationButtonAction(_ sender: Any) {
        guard  let login = userNameTextField.text,
               let password = passwordTextField.text,
               let name = nameTextField.text,
               let email = emailTextField.text else { return }
        if login.isEmpty || password.isEmpty || name.isEmpty || email.isEmpty {
            let alert = UIAlertController(title: "Предупреждение", message: "Есть путые поля", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: .none)
            alert.addAction(action)
            present(alert, animated: true, completion: .none)
        } else {
            let userInfoDict = ["login": login,
                                "password": password,
                                "name": name,
                                "email": email]
            UserDefaults.standard.set(userInfoDict, forKey: "userInfo")
            guard let nextScreen = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MainView")
                    as? MainViewController else { return }
            nextScreen.modalPresentationStyle = .fullScreen
            self.show(nextScreen, sender: nil)
        }
    }
}

/// UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            nameTextField.becomeFirstResponder()
        case nameTextField:
            nameTextField.resignFirstResponder()
        default:
            return false
        }
        return true
    }
}
