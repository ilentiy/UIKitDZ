//
//  AlarmViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 01.10.2022.
//

import UIKit

/// Экран будильника
final class AlarmViewController: UIViewController {
    
    @IBOutlet weak var alarmFirstView: UIView!
    
    @IBOutlet weak var alarmSecondView: UIView!
    
    @IBOutlet weak var alarmThirdView: UIView!
    
    @IBOutlet weak var firstAlarmSwitch: UISwitch!
    
    @IBOutlet weak var secondAlarmSwitch: UISwitch!
    
    @IBOutlet weak var thirdAlarmSwitch: UISwitch!
    
    @IBOutlet weak var settingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        settingButton.layer.cornerRadius = 25
        
    }
}
