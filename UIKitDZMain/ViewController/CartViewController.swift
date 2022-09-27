//
//  CartViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 27.09.2022.
//

import UIKit

/// Корзина покупателя
class CartViewController: UIViewController {
    
    var sizePicker = UIPickerView()
    let sizeArticle = ["US", "EUR"]
    let sizeUS = ["12", "12.5", "13", "14"]
    let sizeEUR = ["45.5", "46", "46.5", "48"]
    var segmentControl = UISegmentedControl()
    var printTarget = ""
    var shoes = Shoes()
    
    lazy var shoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 20, y: 75, width: 375, height: 375)
        imageView.image = UIImage(named: self.shoes.image)
        return imageView
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 15, width: 375, height: 50)
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = self.shoes.name
        return label
    }()
    
    lazy var costLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 450, width: 375, height: 40)
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = self.shoes.price
        return label
    }()
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 500, width: 80, height: 40)
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Размер: "
        return label
    }()
    
    lazy var sizeTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 550, width: 50, height: 50)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5
        textField.placeholder = "Размер"
        return textField
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 700, width: 375, height: 75)
        button.layer.cornerRadius = 30
        button.backgroundColor = .tintColor
        button.setTitle("Купить", for: .normal)
        button.addTarget(self, action: #selector(confirmBuyAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSegmentControl()
        createSizePicker()
        
    }
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(shoesImageView)
        view.addSubview(nameLabel)
        view.addSubview(costLabel)
        view.addSubview(sizeLabel)
        view.addSubview(sizeTextField)
        view.addSubview(buyButton)
    }
    
    func createSizePicker() {
        sizePicker.dataSource = self
        sizePicker.delegate = self
        sizeTextField.inputView = sizePicker
    }
    func setupSegmentControl() {
        segmentControl = UISegmentedControl(items: sizeArticle)
        segmentControl.frame = CGRect(x: 100, y: 500, width: 80, height: 40)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(selegtedValue), for: .valueChanged)
        printTarget = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex) ?? ""
        
        view.addSubview(segmentControl)
    }
    
    @objc func selegtedValue(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            printTarget = target.titleForSegment(at: segmentIndex) ?? ""
        }
        
    }
    
    @objc func confirmBuyAction() {
        let alert = UIAlertController(title: "Подтверждение",
                                      message: "Для покупки введите номер телефона",
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let resultAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(resultAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
extension CartViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch printTarget {
        case "US":
            return sizeUS[row]
        case "EUR":
            return sizeEUR[row]
        default:
            return "Error"
        }
    }
}
extension CartViewController: UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch printTarget {
        case "US":
            return sizeUS.count
        case "EUR":
            return sizeEUR.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch printTarget {
        case "US":
            sizeTextField.text = sizeUS[row]
            sizeTextField.resignFirstResponder()
        case "EUR":
            sizeTextField.text = sizeEUR[row]
            sizeTextField.resignFirstResponder()
        default:
            return
        }
        
    }
}
