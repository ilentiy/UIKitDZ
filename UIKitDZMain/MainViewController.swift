//
//  MainViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 04.10.2022.
//

import UIKit

/// Главный Экран
final class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var importanceSwitch: UISwitch!
    
    @IBOutlet weak var addReminder: UIButton!
    
    @IBOutlet weak var reminderTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        userData()
        
    }
    
    private func userData() {
        if let user = UserDefaults.standard.object(forKey: "userInfo") as? [String: String] {
            welcomeLabel.text = "Привествую, \(user["name"] ?? "userName")"
        }
    }
    @IBAction func addReminderAction(_ sender: Any) {
        showAlert()
    }
}

/// extension
extension MainViewController {
    func showAlert() {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .short
        
        let title: String = {
            guard let text = reminderTextField.text else { return ""}
            if importanceSwitch.isOn {
                return "Важно:  \(text)"
            }
            return text
        }()
        
        let messageText = "Нужно это сделать " + dateFormat.string(from: datePicker.date)
        let reminderAlert = UIAlertController(title: title,
                                              message: messageText,
                                              preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Добавить", style: .default)
        reminderAlert.addAction(alertAction)
        present(reminderAlert, animated: true)
    }
}
