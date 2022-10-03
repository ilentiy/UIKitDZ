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
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var hour = 0
    var minute = 0
    var second = 0
    var time = 0
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        timePicker.backgroundColor = .clear
        timerLabel.isHidden = true
        timerLabel.textAlignment = .center
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        timePicker.isHidden = true
        hmsLabel.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(update),
                                     userInfo: nil,
                                     repeats: true)
        time = hour * 24 * 60 * 60
        time += minute * 60
        time += second
        timerLabel.isHidden = false
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        timePicker.isHidden = false
        hmsLabel.isHidden = false
        timer?.invalidate()
        timerLabel.isHidden = true
    }
    
    @objc func update() {
        var text = ""
        if time >= 0 {
            var sec = time % 60
            var min = time / 60 % 60
            var hour = time / 60 / 60 / 24
            switch hour {
            case 0:
                text = ""
            case 1..<10:
                text = "0\(hour):"
            default:
                text = "\(hour):"
            }
            switch min {
            case 0:
                text += "00:"
            case 1..<10:
                text += "0\(min):"
            default:
                text += "\(min):"
            }
            switch sec {
            case 0:
                text += "00"
            case 1..<10:
                text += "0\(sec)"
            default:
                text += "\(sec)"
            }
        }
        timerLabel.text = text
        time -= 1
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
