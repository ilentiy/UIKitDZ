//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Регистрация пользователя
final class RegistrationViewController: UIViewController {
    
    var nameViewLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 107, y: 100, width: 180, height: 80)
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.0
        label.font = UIFont(name: "Helvetica", size: 17)
        label.textAlignment = .center
        label.textColor = .blue
        label.text = "Birthday Reminder"
        label.numberOfLines = 0
        return label
    }()
    
    var signInLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 250, width: 150, height: 50)
        label.font = UIFont(name: "Helvetica", size: 35)
        label.textColor = .black
        label.text = "Sign In"
        label.numberOfLines = 0
        return label
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 300, width: 150, height: 30)
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textColor = .blue
        label.text = "Email"
        label.numberOfLines = 0
        return label
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 330, width: 350, height: 30)
        textField.placeholder = "Введите Email"
        textField.addBottomBorder()
        return textField
    }()
    
    var passwordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 400, width: 150, height: 30)
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textColor = .blue
        label.text = "Пароль"
        label.numberOfLines = 0
        return label
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 430, width: 350, height: 30)
        textField.placeholder = "ВВедите пароль"
        textField.isSecureTextEntry = true
        textField.addBottomBorder()
        return textField
    }()
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 350, y: 430, width: 30, height: 30)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 600, width: 350, height: 60)
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        return button
    }()
    
    var faceIDLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 107, y: 485, width: 150, height: 80)
        label.font = UIFont(name: "Helvetica", size: 17)
        label.textAlignment = .center
        label.text = "Вход по Face ID"
        label.numberOfLines = 0
        return label
    }()
    
    var faceIDSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 280, y: 510, width: 0, height: 0)
        switcher.isOn = true
        return switcher
    }()
    
    var isHidePassword = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
    }
    
    func addSubview() {
        view.addSubview(nameViewLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(faceIDLabel)
        view.addSubview(faceIDSwitch)
        view.addSubview(signInButton)
        view.backgroundColor = .white
    }
    
    @objc func signInButtonAction(sender: UIButton!) {
        let birthdayViewController = BirthdayViewController()
        self.navigationController?.pushViewController(birthdayViewController, animated: true)
        
    }
    
    @objc func showPasswordAction(sender: UIButton!) {
        if isHidePassword {
            isHidePassword = false
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            isHidePassword = true
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
}

/// Добавляет подчеркивание Текстфилду
extension UITextField {
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
