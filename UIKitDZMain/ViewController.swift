//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var myTextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    func setupUI() {
        myTextView = UITextView(frame: CGRect(x: 20,
                                              y: 250,
                                              width: view.bounds.width - 40,
                                              height: view.bounds.height / 2))
        myTextView.text = "Some Text"
        myTextView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        myTextView.font = UIFont.systemFont(ofSize: 17)
        myTextView.backgroundColor = .lightGray
        view.addSubview(myTextView)
    }
    
    override func touchesBegan(_ toucheSet: Set<UITouch>, with event: UIEvent?) {
        myTextView.resignFirstResponder()
        myTextView.backgroundColor = .white
    }
    
   @objc func updateTextView(param: Notification) {
        let userInfo = param.userInfo
        
        guard let getKeyboardRect = (userInfo?[UIResponder.keyboardFrameBeginUserInfoKey]
                                     as? NSValue)?.cgRectValue else { return }
        let keyboardFrame = view.convert(getKeyboardRect, from: view.window)
        if param.name == UIResponder.keyboardWillHideNotification {
            myTextView.contentInset = UIEdgeInsets.zero
        } else {
            myTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            myTextView.scrollIndicatorInsets = myTextView.contentInset
        }
        myTextView.scrollRangeToVisible(myTextView.selectedRange)
    }
}
extension ViewController: UITextViewDelegate {
    
}
