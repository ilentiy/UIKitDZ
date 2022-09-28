//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Повторение видео
final class ViewController: UIViewController {

    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
    }
    // MARK: - Method
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        view.addSubview(textField)
    }
    
    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 50, y: 500, width: 280, height: 44)
        buttonShare.setTitle("Расшарить", for: .normal)
        buttonShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        view.addSubview(buttonShare)
    }
    
    @objc func handleShare(paramSender: Any) {
        let text = textField.text
        if text?.count == 0 {
            let message = "Сначала введите текст потом нажмите кнопку"
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
        activityViewController = UIActivityViewController(activityItems: [text ?? "nil"], applicationActivities: nil)
        guard let activityViewController = activityViewController else {
            return
        }
        present(activityViewController, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
