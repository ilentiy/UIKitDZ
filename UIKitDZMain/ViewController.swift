//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Главный Контроллер, который преобразует введенное слово
final class ViewController: UIViewController {
    
    var helloLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 107, y: 400, width: 200, height: 50)
        return label
    }()
    lazy var convertButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 107, y: 300, width: 200, height: 50)
        button.setTitle("Преобразовать", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(start), for: .touchUpInside)
        return button
    }()
    lazy var alertController: UIAlertController = {
        let alert = UIAlertController(title: "Вечер в хату", message: "Введите текст", preferredStyle: .alert)
        let result = UIAlertAction(title: "ОК", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            var checkText = CheckText()
            var resultText = checkText.check(text: text)
            self.helloLabel.text = resultText
        }
        alert.addTextField()
        alert.addAction(result)
        return alert
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
    }
    @objc func start() {
        present(alertController, animated: true)
    }
    func addSubView() {
        view.addSubview(convertButton)
        view.addSubview(helloLabel)
        
    }
}
