//
//  RegistrationViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 27.09.2022.
//

import UIKit

/// Вход в магазин
class RegistrationViewController: UIViewController {
    
    var startImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "start")
        imageView.alpha = 0.20
        
        return imageView
    }()
    
    var nameViewLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 7, y: 120, width: 400, height: 125)
        label.font = UIFont(name: "Don Graffiti", size: 50)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "SneakerS"
        label.numberOfLines = 0

        return label
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 25
        textField.frame = CGRect(x: 30, y: 330, width: 350, height: 50)
        textField.placeholder = "Email"
        textField.backgroundColor = .white
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 25
        textField.frame = CGRect(x: 30, y: 430, width: 350, height: 50)
        textField.placeholder = "Пароль"
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 330, y: 430, width: 50, height: 50)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    
    var isHidePassword = true
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 600, width: 350, height: 60)
        button.layer.cornerRadius = 30
        button.backgroundColor = .tintColor
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        return button
    }()
    
    var faceIDLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 107, y: 485, width: 150, height: 80)
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
    }
    
    func addSubview() {
        view.backgroundColor = .white
        startImageView.frame = CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height))
        view.addSubview(startImageView)
        view.addSubview(nameViewLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(faceIDLabel)
        view.addSubview(faceIDSwitch)
        view.addSubview(signInButton)
        
    }
    @objc func signInButtonAction(sender: UIButton!) {
        let scoreViewController = ScoreViewController()
        self.navigationController?.pushViewController(scoreViewController, animated: true)
        
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

extension UITextField {
    func addBottomBorder() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
