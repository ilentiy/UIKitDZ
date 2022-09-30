//
//  FoodCategoryViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 28.09.2022.
//

import UIKit

/// Категории еды
final class FoodListViewController: UIViewController {
    
    private lazy var pizzaView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 150, width: self.view.frame.width - 20, height: 200)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.orange.cgColor
        view.backgroundColor = .white
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 0, y: 75, width: view.frame.width, height: 50)
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        nameLabel.text = "Пицца"
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: view.frame.width - 160, y: 25, width: 150, height: 150)
        imageView.image = UIImage(named: "пицца")
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(pizzaButtonAction), for: .touchUpInside)
        
        view.addSubview(nameLabel)
        view.addSubview(imageView)
        view.addSubview(button)
        return view
    }()
    
    private lazy var sushiView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 360, width: self.view.frame.width - 20, height: 200)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.placeholderText.cgColor
        view.backgroundColor = .white
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 0, y: 75, width: view.frame.width, height: 50)
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        nameLabel.textAlignment = .center
        nameLabel.text = "Cуши"
        nameLabel.textColor = .placeholderText
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        button.backgroundColor = .clear
        
        view.addSubview(nameLabel)
        view.addSubview(button)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Food"
        view.backgroundColor = .white
        pizzaView.center.x = view.center.x
        sushiView.center.x = view.center.x
        view.addSubview(pizzaView)
        view.addSubview(sushiView)
    }
    
    @objc private func pizzaButtonAction() {
        let pizzaListViewController = PizzaListViewController()
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(pizzaListViewController, animated: true)
    }
}
