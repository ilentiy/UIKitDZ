//
//  SettingsViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 05.10.2022.
//

import UIKit

/// Настройки  читалки
class SettingsViewController: UIViewController {
    
    // MARK: - Visual Components
    lazy var themeSwitch: UISwitch = {
        let themeSwitch = UISwitch()
        themeSwitch.frame = CGRect(x: 60, y: 30, width: 0, height: 0)
        themeSwitch.onTintColor = .lightGray
        themeSwitch.tintColor = .lightGray
        themeSwitch.addTarget(self, action: #selector(changeTheme), for: .valueChanged)
        return themeSwitch
    }()
    
    lazy var fontSizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 10
        slider.maximumValue = 60
        slider.value = 20
        // slider.addTarget(self, action: #selector(fontSizeSliderAction), for: .valueChanged)
        slider.frame = CGRect(x: 100, y: 100, width: self.view.bounds.width - 200, height: 30)
        return slider
    }()
    
    var leftSliderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 70, y: 100, width: 30, height: 30)
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .blue
        label.text = "A"
        return label
    }()
    
    lazy var rightSliderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 320, y: 100, width: 30, height: 30)
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .blue
        label.text = "A"
        return label
    }()
    
    // MARK: - Public Property
    weak var delegate: ReaderDelegate?
    
    // MARK: - Private Property
    private var colors: [UIColor] = [.black, .systemBlue, .systemBrown, .systemOrange]

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    @objc func changeTheme() {
        if themeSwitch.isOn {
            view.backgroundColor = .black
            fontSizeSlider.tintColor = .orange
            leftSliderLabel.textColor = .orange
            rightSliderLabel.textColor = .orange
        } else {
            view.backgroundColor = .white
            fontSizeSlider.tintColor = .blue
            leftSliderLabel.textColor = .blue
            rightSliderLabel.textColor = .blue
        }
        delegate?.changeTheme(isChange: themeSwitch.isOn)
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
    }
}
