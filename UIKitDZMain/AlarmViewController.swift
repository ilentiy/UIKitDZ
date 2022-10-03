//
//  AlarmViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 01.10.2022.
//

import UIKit

/// Экран будильника
final class AlarmViewController: UIViewController {
    
    // MARK: - Private Visual Components
    @IBOutlet private weak var alarmFirstView: UIView!
    
    @IBOutlet private weak var alarmSecondView: UIView!
    
    @IBOutlet private weak var alarmThirdView: UIView!
    
    @IBOutlet private weak var firstAlarmSwitch: UISwitch!
    
    @IBOutlet private weak var secondAlarmSwitch: UISwitch!
    
    @IBOutlet private weak var thirdAlarmSwitch: UISwitch!
    
    @IBOutlet private weak var settingButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        settingButton.layer.cornerRadius = 25
    }
}
