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
    @IBOutlet private weak var minuteLabel: UILabel!
    
    @IBOutlet private weak var secondLabel: UILabel!
    
    @IBOutlet private weak var millisecondLabel: UILabel!
    
    @IBOutlet private weak var startButton: UIButton!
    
    @IBOutlet private weak var stopButton: UIButton!
    
    // MARK: - Private Property
    private var timer = Timer()
    private var time = 0
    
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
    @IBAction private func startButtonAction(_ sender: Any) {
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
    
    @IBAction private func stopButtonAction(_ sender: Any) {
        time = 0
        minuteLabel.text = "00"
        secondLabel.text = "00"
        millisecondLabel.text = "00"
    }
}
