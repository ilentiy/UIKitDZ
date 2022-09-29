//
//  ScoreViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 27.09.2022.
//

import UIKit

/// Магазин
class ScoreViewController: UIViewController {
    
    lazy var shoesOneView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 5, y: 100, width: 190, height: 285)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        
        var button: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 190, height: 285)
            button.backgroundColor = .clear
            button.tag = 0
            button.addTarget(self, action: #selector(shoesOneACtion), for: .touchUpInside)
            return button
        }()
        
        var shoesImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 10, y: 10, width: 170, height: 170)
            imageView.image = UIImage(named: "shoes1")
            imageView.layer.cornerRadius = 30
            return imageView
        }()
        
        var nameLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 185, width: 190, height: 40)
            label.textColor = .gray
            label.font = UIFont(name: "Helvetica-Bold", size: 13)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = "New Balance 574 Evergreen"
            return label
        }()
        
        var costLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 225, width: 200, height: 40)
            label.textColor = .black
            label.font = UIFont(name: "Helvetica-Bold", size: 16)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = "20.000 RUB"
            return label
        }()
        
        view.addSubview(shoesImageView)
        view.addSubview(nameLabel)
        view.addSubview(costLabel)
        view.addSubview(button)
        return view
    }()
    
    lazy var shoesTwoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 200, y: 100, width: 190, height: 285)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        
        var button: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 190, height: 285)
            button.backgroundColor = .clear
            button.tag = 1
            button.addTarget(self, action: #selector(shoesOneACtion), for: .touchUpInside)
            return button
        }()
        
        var shoesImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 10, y: 10, width: 170, height: 170)
            imageView.image = UIImage(named: "shoes2")
            imageView.layer.cornerRadius = 30
            return imageView
        }()
        
        var nameLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 185, width: 190, height: 40)
            label.textColor = .gray
            label.font = UIFont(name: "Helvetica-Bold", size: 13)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = "New Balance Fresh Foam Hierro v6 GTX"
            return label
        }()
        
        var costLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 225, width: 200, height: 40)
            label.textColor = .black
            label.font = UIFont(name: "Helvetica-Bold", size: 16)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = "24.000 RUB"
            return label
        }()
        
        view.addSubview(shoesImageView)
        view.addSubview(nameLabel)
        view.addSubview(costLabel)
        view.addSubview(button)
        return view
    }()
    
    lazy var shoesThreeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 5, y: 390, width: 190, height: 285)
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        
        var button: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 190, height: 285)
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(shoesOneACtion), for: .touchUpInside)
            button.tag = 2
            return button
        }()
        
        var shoesImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 10, y: 10, width: 170, height: 170)
            imageView.image = UIImage(named: "shoes3")
            imageView.layer.cornerRadius = 30
            return imageView
        }()
        
        var nameLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 185, width: 190, height: 20)
            label.textColor = .gray
            label.font = UIFont(name: "Helvetica-Bold", size: 13)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = "New Balance 554 Black"
            return label
        }()
        
        var costLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 225, width: 200, height: 40)
            label.textColor = .black
            label.font = UIFont(name: "Helvetica-Bold", size: 16)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.text = "18.000 RUB"
            return label
        }()
        
        view.addSubview(shoesImageView)
        view.addSubview(nameLabel)
        view.addSubview(costLabel)
        view.addSubview(button)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(shoesOneView)
        view.addSubview(shoesTwoView)
        view.addSubview(shoesThreeView)
    }
    
    @objc func shoesOneACtion(sender: UIButton) {
        let shoes = Shoes()
        let itemCard = CartViewController()
        switch sender.tag {
        case 0:
            shoes.name = "New Balance 574 Evergreen"
            shoes.image = "shoes1"
            shoes.price = "20.000 RUB"
        case 1:
            shoes.name = "New Balance Fresh Foam Hierro v6 GTX"
            shoes.image = "shoes2"
            shoes.price = "24.000 RUB"
        case 2:
            shoes.name = "New Balance 554 Black"
            shoes.image = "shoes3"
            shoes.price = "18.000 RUB"
        default:
            return
        }
        itemCard.shoes = shoes
        navigationController?.present(itemCard, animated: true)
    }
}
