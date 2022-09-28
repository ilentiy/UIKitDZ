//
//  MainViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 27.09.2022.
//

import UIKit

/// MainViewController:  Главный контроллер
/// - для закрепления UIActivityViewController
final class MainViewController: UIViewController {
    
    private var activityViewController: UIActivityViewController?
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    @IBAction func shareButtonAction(_ sender: Any) {
        activityViewControllerAction()
    }
    
    private func activityViewControllerAction() {
        if textField.text?.count == 0 {
            activityViewController = UIActivityViewController(
                activityItems: [imageView.image ?? UIImageView()],
                applicationActivities: nil
            )
        } else {
            activityViewController = UIActivityViewController(
                activityItems: [
                    textField.text ?? "",
                    imageView.image ?? UIImageView()
                ],
                applicationActivities: nil
            )
        }
        guard let activityViewController = activityViewController else { return }
        present(activityViewController, animated: true)
    }
}

/// UIPickerViewDataSource
extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
}

/// UIPickerViewDelegate
extension MainViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            activityViewControllerAction()
        }
    }
}
