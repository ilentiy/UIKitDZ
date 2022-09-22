//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var guessGame = GuessNumberGame()
    var enterNameAlert = UIAlertController(title: "Приветстую", message: "Введите имя", preferredStyle: .alert)
    var additionButton = UIButton()
    var guessButton = UIButton()
    var myNameLabel = UILabel()
    var resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNameLabel.frame = CGRect(x: 107, y: 300, width: 200, height: 50)
        myNameLabel.textColor = UIColor.red
        myNameLabel.numberOfLines = 0
        myNameLabel.textAlignment = .center
        
        resultLabel.textAlignment = .center
        
        additionButton.frame = CGRect(x: 107, y: 350, width: 200, height: 50)
        additionButton.backgroundColor = .orange
        additionButton.setTitle("Сложение", for: .normal)
        additionButton.layer.cornerRadius = 20
        additionButton.addTarget(self, action: #selector(buttonAddition), for: .touchUpInside)
        
        guessButton.frame = CGRect(x: 107, y: 450, width: 200, height: 50)
        guessButton.setTitle("Угадай число", for: .normal)
        guessButton.backgroundColor = .blue
        guessButton.layer.cornerRadius = 20
        guessButton.addTarget(self, action: #selector(guessNumber), for: .touchUpInside)
        
        self.view.addSubview(myNameLabel)
        self.view.addSubview(resultLabel)
        self.view.addSubview(additionButton)
        self.view.addSubview(guessButton)
    }
    override func viewDidAppear(_ animated: Bool) {
        enterNameAlert.addTextField()
        
        let resultAction = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let myName =  self.enterNameAlert.textFields?.first?.text else { return }
            self.myNameLabel.text = myName
        }
        
        enterNameAlert.addAction(resultAction)
        present(enterNameAlert, animated: true)
    }
    @objc func buttonAddition(sender: UIButton!) {
        showAdditionAlert()
    }
    @objc func guessNumber(sender: UIButton!) {
        guessNumberAlert()
    }
}
extension ViewController {
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
            if self.guessGame.isRight(answer: self.guessGame.answer) {
                self.resultLabel.textColor = .green
                self.resultLabel.text = "Верно я загадал \(self.guessGame.secret)"
            } else {
                self.resultLabel.textColor = .red
                self.resultLabel.text = "Не верно я загадал \(self.guessGame.secret)"
                
            }
        }
        let cancelAction = UIAlertAction(title: "Не сейчас", style: .cancel, handler: nil)
        
        alert.addAction(resultAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true) {
            self.guessGame.generate()
        }
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let number = Int(text) else { return }
        guessGame.answer = number
    }
}

/// Класс для игры угадай число
class GuessNumberGame {
    var secret: Int
    var answer: Int
    init() {
        secret = 0
        answer = 0
    }
    func generate() {
        secret = Int.random(in: 1...5)
    }
    func isRight(answer: Int) -> Bool {
        secret == answer
    }
}
