//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Стартовый Контроллер предлагающий, сложить два числа или сыграть в "Угадай число"
final class GameViewController: UIViewController {
        
    lazy var additionButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 107, y: 350, width: 200, height: 50)
        button.backgroundColor = .orange
        button.setTitle("Сложение", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonAdditionAction), for: .touchUpInside)
        return button
    }()
    
    lazy var guessButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 107, y: 450, width: 200, height: 50)
        button.setTitle("Угадай число", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(guessNumberAction), for: .touchUpInside)
        return button
    }()
    
    var myNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 107, y: 300, width: 200, height: 50)
        label.textColor = UIColor.red
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    var enterNameAlert: UIAlertController = {
        let alertController =  UIAlertController(title: "Приветстую", message: "Введите имя", preferredStyle: .alert)
        alertController.addTextField()
        return alertController
    }()
    
    var guessGame = GuessNumberGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        enterName()
    }
    
    @objc func buttonAdditionAction(sender: UIButton!) {
        showAdditionAlert()
    }
    
    @objc func guessNumberAction(sender: UIButton!) {
        guessNumberAlert()
    }
}

/// Добавил алерт контроллеры
extension GameViewController {
    func showAdditionAlert() {
        let alert = UIAlertController(title: "Могу сложить два числа", message: "введи числа", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        
        let resultAction = UIAlertAction(title: "Сложить", style: .default) { _ in
            guard let text = alert.textFields?.first?.text, let numberOne = Int(text) else { return }
            guard let text = alert.textFields?[1].text, let numberTwo = Int(text) else { return }
            self.resultLabel.textColor = .black
            self.resultLabel.text = "\(numberOne) + \(numberTwo) = \(numberOne + numberTwo)"
            self.resultLabel.frame = CGRect(x: 107, y: 400, width: 200, height: 50)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(resultAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func guessNumberAlert() {
        let alert = UIAlertController(title: "Угадай число",
                                      message: "Я задумал число от 1 до 5, отгадаешь?",
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.delegate = self
        }
        
        let resultAction = UIAlertAction(title: "Попробовать", style: .default) { _ in
            self.resultLabel.frame = CGRect(x: 107, y: 500, width: 200, height: 50)
            guard self.guessGame.isRight(answer: self.guessGame.answer) else {
                self.resultLabel.textColor = .red
                self.resultLabel.text = "Не верно я загадал \(self.guessGame.secret)"
                return
            }
            
            self.resultLabel.textColor = .green
            self.resultLabel.text = "Верно я загадал \(self.guessGame.secret)"
        }
        
        let cancelAction = UIAlertAction(title: "Не сейчас", style: .cancel, handler: nil)
        alert.addAction(resultAction)
        alert.addAction(cancelAction)
        present(alert, animated: true) {
            self.guessGame.generate()
        }
    }
    
    func addSubview() {
        self.view.addSubview(myNameLabel)
        self.view.addSubview(resultLabel)
        self.view.addSubview(additionButton)
        self.view.addSubview(guessButton)
    }
}

/// UITextFieldDelegate
extension GameViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let number = Int(text) else { return }
        guessGame.answer = number
    }
    
    func enterName() {
        let resultAction = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let myName =  self.enterNameAlert.textFields?.first?.text else { return }
            self.myNameLabel.text = myName
        }
        
        enterNameAlert.addAction(resultAction)
        present(enterNameAlert, animated: true)
    }
}
