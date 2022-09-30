//
//  CompositionViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 30.09.2022.
//

import UIKit

/// Калорийность и состав
class CompositionViewController: UIViewController {
    
    var pizza = Pizza()
    
    private lazy var compositionLabel: UILabel = {
        var text = "Состав:\n"
        for item in 0..<pizza.composition.count {
            text += "\(item + 1). \(pizza.composition[item])\n"
        }
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 200, width: view.frame.width, height: 300)
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.numberOfLines = 0
        label.text = text
        return label
    }()
    
    private lazy var caloriesLabel: UILabel = {
        var text = """
        Калорийность: \(pizza.calories) калорий
        Б: \(pizza.proteins) г.  Ж: \(pizza.fats) г. У: \(pizza.carbohydrates) г.
        """
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 150, width: view.frame.width, height: 50)
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.numberOfLines = 0
        label.text = text
        return label
    }()
    
    private lazy var okButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 600, width: view.frame.width-80, height: 60)
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(okButtonAction), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(caloriesLabel)
        view.addSubview(compositionLabel)
        view.addSubview(okButton)
    }
    
    @objc private func okButtonAction() {
        dismiss(animated: true)
    }
    
}
