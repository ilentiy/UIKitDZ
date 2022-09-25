//
//  UserDataViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 25.09.2022.
//

import UIKit

/// Заполняем информацию о человеке
class UserDataViewController: UIViewController {
    
    var userData = UserData()
    
    var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        return datePicker
    }()
    
    var agePicker = UIPickerView()
    
    var genderPicker = UIPickerView()
    
    var userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 125, y: 30, width: 170, height: 170)
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .gray
        return imageView
    }()
    
    var changePhotoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 107, y: 200, width: 200, height: 50)
        button.setTitle("Изменить фото", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 300, width: 150, height: 30)
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textColor = .blue
        label.text = "Имя"
        label.numberOfLines = 0
        return label
    }()
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 340, width: 350, height: 30)
        textField.placeholder = "Введите имя"
        textField.addBottomBorder()
        return textField
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 400, width: 150, height: 30)
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textColor = .blue
        label.text = "Дата"
        label.numberOfLines = 0
        return label
    }()
    
    var dateTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 440, width: 350, height: 30)
        textField.placeholder = "Выберите дату"
        textField.addBottomBorder()
        return textField
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 500, width: 150, height: 30)
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textColor = .blue
        label.text = "Возраст"
        label.numberOfLines = 0
        return label
    }()
    
    var ageTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 540, width: 350, height: 30)
        textField.placeholder = "Выберите возраст"
        textField.addBottomBorder()
        return textField
    }()
    
    var genderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 600, width: 150, height: 30)
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textColor = .blue
        label.text = "Пол"
        label.numberOfLines = 0
        return label
    }()
    
    var genderTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 640, width: 350, height: 30)
        textField.placeholder = "Выберите пол"
        textField.addBottomBorder()
        return textField
    }()
    
    var instagramLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 700, width: 150, height: 30)
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textColor = .blue
        label.text = "Instagram"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var instagramTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 740, width: 350, height: 30)
        textField.placeholder = "Введите  instagram"
        textField.addTarget(self, action: #selector(createInstagramAlertController), for: .touchUpInside)
        textField.addBottomBorder()
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNavigationBar()
        addSubview()
        createDatePicker()
        createAgePicker()
        createGenderPicker()
    }
    
    func addSubview() {
        view.backgroundColor = .white
        view.addSubview(userPhotoImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(instagramLabel)
        view.addSubview(instagramTextField)
        
    }
    
    func createNavigationBar() {
        let cancelButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 5, y: 10, width: 100, height: 30)
            button.setTitle("Отменить", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
            button.backgroundColor = .clear
            return button
        }()
        
        let addButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 300, y: 10, width: 100, height: 30)
            button.setTitle("Добавить", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
            button.backgroundColor = .clear
            return button
        }()
        
        view.addSubview(cancelButton)
        view.addSubview(addButton)
    }
    
    @objc func cancelButtonAction() {
        
    }
    @objc func addButtonAction() {
        
    }
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonAction))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func createDatePicker() {
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
    }
    
    func createAgePicker() {
        agePicker.dataSource = self
        agePicker.delegate = self
        ageTextField.inputView = agePicker
    }
    
    func createGenderPicker() {
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderTextField.inputView = genderPicker
    }
    
    @objc func createInstagramAlertController() {
        lazy var alertController: UIAlertController = {
            let alert = UIAlertController(title: "Instagram", message: "Введите свой instagram", preferredStyle: .alert)
            let result = UIAlertAction(title: "ОК", style: .default) { _ in
                guard let text = alert.textFields?.first?.text else { return }
                self.instagramLabel.text = text
            }
            alert.addTextField()
            alert.textFields?.first?.placeholder = " например ilentiy"
            alert.addAction(result)
            present(alert, animated: true)
            return alert
        }()
    }
    
    @objc func doneButtonAction() {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .medium
        dateFormat.timeStyle = .none
        
        self.dateTextField.text = dateFormat.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
}

extension UserDataViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var result: String = ""
        switch pickerView {
        case genderPicker:
            result = userData.gender[row]
        case agePicker:
            result = "\(userData.ages[row])"
        default:
            result = "Error"
        }
        return result
    }
}

extension UserDataViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case genderPicker:
            return userData.gender.count
        case agePicker:
            return userData.ages.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case genderPicker:
            genderTextField.text = userData.gender[row]
            genderTextField.resignFirstResponder()
        case agePicker:
            ageTextField.text = "\(userData.ages[row])"
            ageTextField.resignFirstResponder()
        default:
            return
        }
        
    }
}
