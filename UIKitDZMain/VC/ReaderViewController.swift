//
//  ReaderViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 05.10.2022.
//

import UIKit

protocol ReaderDelegate: AnyObject {
    func font(fontName: String, size: CGFloat)
    func fontSize(fontName: String, size: CGFloat)
    func fontStyle(style: UIFont)
    func changeTheme(isChange: Bool)
    func textColor(color: UIColor)
}
/// Экран читалки
final class ReaderViewController: UIViewController {
    private enum Constants {
        
    }
    // MARK: - Visual Components
    private var textView: UITextView {
        let textView = UITextView()
        textView.text = "poemText.text"
        textView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        textView.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: view.bounds.height - 150)
        textView.font = UIFont(name: "Helvetica", size: 20)
        textView.isUserInteractionEnabled = false
        return textView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func barButtonAction() {
        let settingsViewController = SettingsViewController()
        settingsViewController.delegate = self
        if let sheet = settingsViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(settingsViewController, animated: true)
    }
}

/// SetupUI
extension ReaderViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(textView)
        let barButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(barButtonAction))
        navigationItem.setRightBarButton(barButton, animated: true)
    }
    
}

extension ReaderViewController: ReaderDelegate {
    func font(fontName: String, size: CGFloat) {
        print("Шрифт")    }
    
    func fontSize(fontName: String, size: CGFloat) {
        print("Размер")
    }
    
    func fontStyle(style: UIFont) {
        print("Толстый")
    }
    
    func changeTheme(isChange: Bool) {
        if isChange {
            textView.textColor = .white
            view.backgroundColor = .black
            textView.backgroundColor = .black
        } else {
            textView.textColor = .black
            view.backgroundColor = .white
            textView.backgroundColor = .white
        }
    }
    
    func textColor(color: UIColor) {
        print("Цвет")
        
    }
    
}
