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
    
    @IBOutlet private weak var importanceSwitch: UISwitch!
    
    @IBOutlet private weak var addReminder: UIButton!
    
    @IBOutlet private weak var reminderTextField: UITextField!
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    
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
        let message = "Нужно это сделать " + dateFormat.string(from: datePicker.date)
        showAlert(title: title, message: message)
    }
}
