//
//  SettingsViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 05.10.2022.
//

import UIKit

/// Настройки  читалки
class SettingsViewController: UIViewController {
    private enum Constants {
        static let labelText = "A"
    }
    // MARK: - Visual Components
    private lazy var themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.frame = CGRect(x: 60, y: 30, width: 0, height: 0)
        themeSwitch.onTintColor = .lightGray
        themeSwitch.tintColor = .lightGray
        themeSwitch.addTarget(self, action: #selector(changeTheme), for: .valueChanged)
        return themeSwitch
    }()
    
    private lazy var fontSizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 10
        slider.maximumValue = 60
        slider.value = 20
        slider.addTarget(self, action: #selector(fontSizeSliderAction), for: .valueChanged)
        slider.frame = CGRect(x: 100, y: 150, width: self.view.bounds.width - 200, height: 30)
        slider.tintColor = .black
        return slider
    }()
    
    private var leftSliderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 150, width: 30, height: 30)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.text = Constants.labelText
        return label
    }()
    
    private lazy var rightSliderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 320, y: 150, width: 30, height: 30)
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .black
        label.text = Constants.labelText
        return label
    }()
    
    private  lazy var defaultColorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 65, y: 80, width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(colorButtonAction), for: .touchUpInside)
        return button
    }()
    
    private  lazy var orangeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 148, y: 80, width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(colorButtonAction), for: .touchUpInside)
        return button
    }()
    
    private  lazy var blueButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 231, y: 80, width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(colorButtonAction), for: .touchUpInside)
        return button
    }()
    
    private  lazy var greenButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 315, y: 80, width: 40, height: 40))
        button.layer.cornerRadius = 20
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(colorButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var thinFontButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 30))
        button.tag = 0
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 15
        button.setTitle(Constants.labelText, for: .normal)
        button.setTitleColor( .black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(weightFontButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var boldFontButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 220, y: 200, width: 100, height: 30))
        button.tag = 1
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitle(Constants.labelText, for: .normal)
        button.setTitleColor( .black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(weightFontButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var fontPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.frame = CGRect(x: 0, y: 250, width: view.frame.width, height: 110)
        return picker
    }()
    
    // MARK: - Public Property
    weak var delegate: ReaderDelegate?
    
    // MARK: - Private Property
    let fontWeights: [UIFont.Weight] = [ .ultraLight,
                                         .thin,
                                         .light,
                                         .medium,
                                         .regular,
                                         .semibold,
                                         .bold,
                                         .heavy,
                                         .black]
    private var fonts = UIFont.familyNames.sorted()
    private var selectFont = "Helvetica"
    private var selectSize: CGFloat = 20
    private lazy var currentFont = UIFont(name: selectFont, size: selectSize)
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    @objc private func changeTheme() {
        if themeSwitch.isOn {
            view.backgroundColor = .black
            fontSizeSlider.tintColor = .white
            leftSliderLabel.textColor = .white
            rightSliderLabel.textColor = .white
            defaultColorButton.backgroundColor = .white
            boldFontButton.setTitleColor( .white, for: .normal)
            boldFontButton.layer.borderColor = UIColor.lightGray.cgColor
            thinFontButton.setTitleColor( .white, for: .normal)
            thinFontButton.layer.borderColor = UIColor.lightGray.cgColor
            fontPickerView.setValue(UIColor.white, forKeyPath: "textColor")
            
        } else {
            view.backgroundColor = .white
            fontSizeSlider.tintColor = .black
            leftSliderLabel.textColor = .black
            rightSliderLabel.textColor = .black
            defaultColorButton.backgroundColor = .black
            boldFontButton.setTitleColor( .black, for: .normal)
            boldFontButton.layer.borderColor = UIColor.darkGray.cgColor
            thinFontButton.setTitleColor( .black, for: .normal)
            thinFontButton.layer.borderColor = UIColor.darkGray.cgColor
            fontPickerView.setValue(UIColor.black, forKeyPath: "textColor")
        }
        delegate?.changeTheme(isChange: themeSwitch.isOn)
    }
    
    @objc private func fontSizeSliderAction(sender: UISlider) {
        selectSize = CGFloat(sender.value)
        guard let changedFont = UIFont(name: selectFont, size: selectSize) else { return }
        delegate?.changeFont(font: changedFont)
    }
    
    @objc private func colorButtonAction(sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        delegate?.textColor(color: color)
    }
    
    @objc private func weightFontButtonAction(sender: UIButton) {
        guard let changedFont = UIFont(name: selectFont, size: selectSize) else { return }
        switch sender.tag {
        case 0:
            delegate?.changeFont(font: changedFont.regular)
        case 1:
            delegate?.changeFont(font: changedFont.bold)
        default:
            break
        }
    }
    
}
/// SetupUI
extension SettingsViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(themeSwitch)
        view.addSubview(fontSizeSlider)
        view.addSubview(leftSliderLabel)
        view.addSubview(rightSliderLabel)
        view.addSubview(defaultColorButton)
        view.addSubview(orangeButton)
        view.addSubview(blueButton)
        view.addSubview(greenButton)
        view.addSubview(boldFontButton)
        view.addSubview(thinFontButton)
        view.addSubview(fontPickerView)
    }
}

// MARK: - UIPickerViewDelegate
extension SettingsViewController: UIPickerViewDelegate { }

// MARK: - UIPickerViewDataSource
extension SettingsViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectFont = fonts[row]
        guard let changedFont = UIFont(name: selectFont, size: selectSize) else { return }
        delegate?.changeFont(font: changedFont)
    }
}
