//
//  TimerViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 01.10.2022.
//

import UIKit

/// Экран таймера
final class TimerViewController: UIViewController {
    
    @IBOutlet weak var hmsLabel: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    var hour = 0
    var minute = 0
    var second = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        timePicker.backgroundColor = .clear        
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        timePicker.isHidden = true
        hmsLabel.isHidden = true
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        timePicker.isHidden = false
        hmsLabel.isHidden = false
    }
    
}

/// UIPickerViewDataSource
extension TimerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        default:
            return 60
        }
    }
    
}

/// UIPickerViewDelegate
extension TimerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minute = row
        case 2:
            second = row
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
       
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "\(row)"
        label.font = UIFont(name: "Helvetica", size: 25)
        return label
    }
}
