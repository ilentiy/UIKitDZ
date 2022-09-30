//
//  PaymentViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 28.09.2022.
//

import UIKit

/// Оплата заказа
final class PaymentViewController: UIViewController {
    
    lazy var payButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 780, width: view.frame.width - 80, height: 70)
        button.layer.cornerRadius = 30
        button.backgroundColor = .black
        button.setTitle("\u{F8FF} Pay", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 30)
        button.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var orderListLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 200, width: view.frame.width, height: 300)
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.numberOfLines = 0
        label.text = order
        return label
    }()
    
    private var cashLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 600, width: 350, height: 40)
        label.font = UIFont(name: "Helvetica", size: 20)
        label.text = "Наличными курьеру"
        return label
    }()
    
    private var creditCartLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 640, width: 350, height: 40)
        label.font = UIFont(name: "Helvetica", size: 20)
        label.text = "Безналичная оплата"
        return label
    }()
    
   lazy private var cashSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 340, y: 600, width: 0, height: 0)
        switcher.isOn = true
        switcher.addTarget(self, action: #selector(switchAction), for: .touchUpInside)
        return switcher
    }()
    
   lazy private var creditCartSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.frame = CGRect(x: 340, y: 640, width: 0, height: 0)
        switcher.addTarget(self, action: #selector(switchAction), for: .touchUpInside)
        return switcher
    }()
    
    weak var delegate: GoToRootController?
    
    var order = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Оплата"
        view.backgroundColor = .white
        view.addSubview(orderListLabel)
        view.addSubview(cashLabel)
        view.addSubview(cashSwitch)
        view.addSubview(creditCartLabel)
        view.addSubview(creditCartSwitch)
        view.addSubview(payButton)
        
    }
    
    @objc func switchAction(sender: UISwitch) {
        if sender === cashSwitch {
            creditCartSwitch.isOn.toggle()
        } else {
            cashSwitch.isOn.toggle()
        }
    }
    
    @objc func payButtonAction() {
        let paidAlertController = UIAlertController(title: "Заказа оплачен!",
                                                    message: """
                                                    Ваш заказ доставят в течении 15 минут!
                                                            Приятного аппетита
                                                    """,
                                                    preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Ок", style: .default) { _ in
            self.dismiss(animated: true)
            self.delegate?.goToRootController()
        }
        paidAlertController.addAction(okAlertAction)
        present(paidAlertController, animated: true)
        
    }
}
