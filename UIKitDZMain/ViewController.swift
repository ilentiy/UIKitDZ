//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Главный экран
final class ViewController: UIViewController {
    private enum Constants {
        static let alerTitle =  "Введите текст"
        static let colorText = "Цвет текста"
        static let numOfLinesText = "Кол-во строк"
        static let viewTitle = "Урок 12"
        static let colors: [UIColor] = [.black, .orange, .blue, .red, .green]
    }
    
    // MARK: - Private Properties
    private var settingPicker = UIPickerView()
    
    private var colorLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 140, y: 150, width: 50, height: 50)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = Constants.colorText
        return label
    }()
    
    private var numOfLinesLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 290, y: 150, width: 50, height: 50)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = Constants.numOfLinesText
        return label
    }()
    
    private lazy var fontSizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 10
        slider.maximumValue = 50
        slider.value = (slider.minimumValue + slider.maximumValue)  / 2.0
        slider.frame = CGRect(x: 0, y: 250, width: 200, height: 20)
        slider.center.x = view.center.x
        slider.addTarget(self, action: #selector(changeFontSizeAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 275, width: view.frame.width, height: 425)
        label.textAlignment = .center
        label.center.x = view.center.x
        label.font = UIFont.systemFont(ofSize: CGFloat(fontSizeSlider.value))
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.shadowColor = .purple
        label.shadowOffset = CGSize(width: Double(fontSizeSlider.value / 15), height: Double(fontSizeSlider.value / 15))
        return label
    }()
        
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Action
    @objc private func textLabelAction() {
        let addTextAlert = UIAlertController(title: Constants.alerTitle, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default) {_ in
            guard let text = addTextAlert.textFields?.first?.text else { return }
            self.textLabel.text = text
            
        }
        addTextAlert.addTextField()
        addTextAlert.addAction(alertAction)
        present(addTextAlert, animated: true)
    }
    
    @objc private func changeFontSizeAction(sender: UISlider) {
        print(CGFloat(sender.value))
        textLabel.font = UIFont.systemFont(ofSize: CGFloat(sender.value))
        textLabel.shadowOffset =  CGSize(width: Double(sender.value / 15), height: Double(sender.value / 15))
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createNavigationView()
        createTabBar()
        createPicker()
        view.backgroundColor = .white
        view.addSubview(colorLabel)
        view.addSubview(numOfLinesLabel)
        view.addSubview(textLabel)
        view.addSubview(fontSizeSlider)
    }
    
    private func createNavigationView() {
        navigationItem.title = Constants.viewTitle
        let barButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(textLabelAction))
        navigationItem.setRightBarButton(barButton, animated: true)
    }
    
    private func createTabBar() {
        tabBarItem = UITabBarItem(title: navigationItem.title, image: UIImage(systemName: "plus"), tag: 0)
    }
    
    private func createPicker() {
        settingPicker.frame = CGRect(x: 25, y: 100, width: view.frame.width - 50, height: 150)
        settingPicker.center.x = view.center.x
        settingPicker.dataSource = self
        settingPicker.delegate = self
        view.addSubview(settingPicker)
    }
}

/// UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return Constants.colors.count
        case 1:
            return 10
        default:
            return 0
        }
    }
}
/// UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let label = UILabel()
        switch component {
        case 0:
            label.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
            label.backgroundColor = Constants.colors[row]
        case 1:
            label.text = "\(row + 1)"
            label.textAlignment = .center
            label.textColor = .black
        default:
            break
        }
        return label
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            textLabel.textColor = Constants.colors[row]
        case 1:
            textLabel.numberOfLines = row + 1
        default:
            break
        }
    }
}
