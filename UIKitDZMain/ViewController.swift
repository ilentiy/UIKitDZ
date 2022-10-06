//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// Экран таймера
final class StopwatchViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var millisecondLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    // MARK: - Property
    var timer = Timer()
    var time = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    @objc func timerUpdate() {
        time += 1
        switch time % 100 {
        case 0..<10:
            millisecondLabel.text = String(format: "0%i", time % 100)
        default:
            millisecondLabel.text = String(format: "%i", time % 100)
        }
        switch (time / 100) % 60 {
        case 0..<10:
            secondLabel.text = String(format: "0%i", (time / 100) % 60)
        default:
            secondLabel.text = String(format: "%i", (time / 100) % 60)
        }
        switch (time / 6000) % 60 {
        case 0..<10:
            minuteLabel.text = String(format: "0%i", (time / 6000) % 60)
        default:
            minuteLabel.text = String(format: "%i", (time / 6000) % 60)
        }
    }
    
    // MARK: - IBActions
    @IBAction func startButtonAction(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if button.isSelected {
            button.setTitle("Стоп", for: .normal)
            
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(timerUpdate),
                                         userInfo: nil,
                                         repeats: true)
            button.isSelected = false
        } else {
            timer.invalidate()
            button.setTitle("Старт", for: .normal)
            button.isSelected = true
        }
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        time = 0
    }
}
