//
//  PizzaListViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 28.09.2022.
//

import UIKit

/// Список доступных пицц
final class PizzaListViewController: UIViewController {
    
    lazy var pepperoniView: UIView = {
        var view = UIView()
        view.frame = CGRect(x: 0, y: 200, width: self.view.frame.width - 20, height: 150)
        view.backgroundColor = .white
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageView.image = UIImage(named: "пепперони")
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 160, y: 50, width: 150, height: 50)
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        nameLabel.text = "Пепперони"
        
        let button = UIButton()
        button.frame = CGRect(x: view.frame.width - 60, y: 50, width: 50, height: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.tintColor = .white
        button.tag = 0
        button.addTarget(self, action: #selector(addPizzaAction), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(button)
        return view
    }()
    
    lazy var mozarellaView: UIView = {
        var view = UIView()
        view.frame = CGRect(x: 0, y: 380, width: self.view.frame.width - 20, height: 150)
        view.backgroundColor = .white
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        imageView.image = UIImage(named: "4сыра")
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 160, y: 50, width: 150, height: 50)
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        nameLabel.text = "Четыре сыра"
        
        let button = UIButton()
        button.frame = CGRect(x: view.frame.width - 60, y: 50, width: 50, height: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.tintColor = .white
        button.tag = 1
        button.addTarget(self, action: #selector(addPizzaAction), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(button)
        return view
    }()
    
    var pizza: [Pizza] = [
        Pizza(name: "Пепперони",
              imageName: "пепперони",
              calories: "1835",
              proteins: "45",
              fats: "76",
              carbohydrates: "350",
              composition: [
              "Вода",
              "Мука",
              "Томатный соус",
              "Колбаски пеппероны",
              "Моцарелла",
              "Специи"
              ]
             ),
        Pizza(name: "Четыре сыра",
              imageName: "4сыра",
              calories: "1997",
              proteins: "70",
              fats: "120",
              carbohydrates: "300",
              composition: [
              "Вода",
              "Мука",
              "Томатный соус",
              "Горгонзола",
              "Моцарелла",
              "Пармезан",
              "Гауда",
              "Специи"
              ]
             )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Pizza"
        view.backgroundColor = .white
        pepperoniView.center.x = view.center.x
        mozarellaView.center.x = view.center.x
        view.addSubview(pepperoniView)
        view.addSubview(mozarellaView)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
    @objc func addPizzaAction(button: UIButton) {
        let ingredientViewController = IngredientViewController()
        ingredientViewController.pizza = pizza[button.tag]
        navigationController?.modalPresentationStyle = .formSheet
        navigationController?.present(ingredientViewController, animated: true)
    }
}
