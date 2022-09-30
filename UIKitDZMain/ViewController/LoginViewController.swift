//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Авторизация
final class LoginViewController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 150, width: 150, height: 150)
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    var phoneLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 25, y: 300, width: 200, height: 50)
        label.textColor = .orange
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.text = "Телефон"
        return label
    }()
    
    var passwordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 25, y: 400, width: 200, height: 50)
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.textColor = .orange
        label.text = "Пароль"
        return label
    }()
    
    var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 25, y: 350, width: 375, height: 40)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.height))
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 15
        textField.keyboardType = .asciiCapableNumberPad
        textField.placeholder = "Введите номер телефона"
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 25, y: 450, width: 375, height: 40)
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 15
        textField.placeholder = "Введите пароль"
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 675, width: view.frame.width - 80, height: 60)
        button.center.x = view.center.x
        button.layer.cornerRadius = 25
        button.setTitle("Погнали", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        phoneTextField.center.x = view.center.x
        passwordTextField.center.x = view.center.x
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
    }
    
    @objc func signInButtonAction(sender: UIButton!) {
        let foodListViewController = FoodListViewController()
        let navigationController = UINavigationController(rootViewController: foodListViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
