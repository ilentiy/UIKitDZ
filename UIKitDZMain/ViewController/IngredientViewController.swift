//
//  IngredientViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 28.09.2022.
//

import UIKit

/// протокол перехода на rootViewController
protocol GoToRootController: AnyObject {
    func goToRootController()
}

/// Добавление ингредиентов
final class IngredientViewController: UIViewController {
    
    var pizza = Pizza()
    
    private lazy var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 10, width: view.frame.width, height: 60)
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        label.textAlignment = .center
        label.text = pizza.name
        return label
    }()
    
    private lazy var pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: pizza.imageName)
        imageView.frame = CGRect(x: 0, y: 60, width: view.frame.width - 50, height: view.frame.width - 50)
        imageView.center.x = view.center.x
        return imageView
    }()
    
    private var addIngredientsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 450, width: 300, height: 50)
        label.font = UIFont(name: "Helvetica", size: 27)
        label.text = "Дополнительно:"
        return label
    }()
    
    private var onionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 500, width: 200, height: 40)
        label.font = UIFont(name: "Helvetica", size: 23)
        label.text = "Лучок"
        return label
    }()
    
    private var mushroomLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 540, width: 200, height: 40)
        label.font = UIFont(name: "Helvetica", size: 23)
        label.text = "Грибочки"
        return label
    }()
    
    private var jalapenoLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 580, width: 200, height: 40)
        label.font = UIFont(name: "Helvetica", size: 23)
        label.text = "Халапешки"
        return label
    }()
    
    private var oliveLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 620, width: 200, height: 40)
        label.font = UIFont(name: "Helvetica", size: 23)
        label.text = "Маслинки"
        return label
    }()
    
    private var onionSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 340, y: 500, width: 0, height: 0)
        return switcher
    }()
    
    private var mushroomSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 340, y: 540, width: 0, height: 0)
        return switcher
    }()
    
    private var jalapenoSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 340, y: 580, width: 0, height: 0)
        return switcher
    }()
    
    private var oliveSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 340, y: 620, width: 0, height: 0)
        return switcher
    }()
    
    private lazy var additionalInfoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 340, y: 450, width: 50, height: 50)
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .tintColor
        button.addTarget(self, action: #selector(additionalInfoButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 700, width: view.frame.width - 80, height: 70)
        button.layer.cornerRadius = 30
        button.backgroundColor = .orange
        button.setTitle("Подтвердить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        button.addTarget(self, action: #selector(confirmButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
   private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(pizzaNameLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(addIngredientsLabel)
        view.addSubview(onionLabel)
        view.addSubview(mushroomLabel)
        view.addSubview(jalapenoLabel)
        view.addSubview(oliveLabel)
        view.addSubview(onionSwitch)
        view.addSubview(mushroomSwitch)
        view.addSubview(jalapenoSwitch)
        view.addSubview(oliveSwitch)
        view.addSubview(confirmButton)
        view.addSubview(additionalInfoButton)
    }
    
    @objc private func confirmButtonAction() {
        let paymentViewController = PaymentViewController()
        let secondNavigationController = UINavigationController(rootViewController: paymentViewController)
        secondNavigationController.modalPresentationStyle = .fullScreen
        paymentViewController.delegate = self
        paymentViewController.order = createOrder()
        present(secondNavigationController, animated: true)
    }
    
    @objc private func additionalInfoButtonAction() {
        let compositionViewController = CompositionViewController()
        compositionViewController.pizza = pizza
        present(compositionViewController, animated: true)
    }
    
    private func createOrder() -> String {
        var order: [String] = [pizza.name]
        if onionSwitch.isOn {
            order.append("Лучок")
        }
        if mushroomSwitch.isOn {
            order.append("Грибочки")
        }
        if jalapenoSwitch.isOn {
            order.append("Халапешки")
        }
        if oliveSwitch.isOn {
            order.append("Маслины")
        }
        var orderText = "Ваш заказ:\n1. \(pizza.name)\n"
        guard order.count == 1 else {
            orderText += "Дополнительно:\n"
            for item in 1..<order.count {
                orderText += "\(item). \(order[item])\n"
            }
            return orderText
        }
        return orderText
    }
}

/// GoToRootControllet
extension IngredientViewController: GoToRootController {
    func goToRootController() {
        if let navigationController = self.presentingViewController as? UINavigationController {
            self.view.isHidden = true
            dismiss(animated: false)
            navigationController.popToRootViewController(animated: false)
        }
    }
}
