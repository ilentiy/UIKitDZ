//
//  ReaderViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 05.10.2022.
//

import UIKit

protocol ReaderDelegate: AnyObject {
    func changeFont(font: UIFont)
    func changeTheme(isChange: Bool)
    func textColor(color: UIColor)
}
/// Экран читалки
final class ReaderViewController: UIViewController {
    
    // MARK: - Visual Components
    private lazy var readerTextView: UITextView = {
        let textView = UITextView()
        textView.text = "poemText.text"
        textView.textColor = .black
        textView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        textView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        textView.font = UIFont(name: "Helvetica", size: 20)
        textView.isUserInteractionEnabled = false
        return textView
    }()
    // MARK: - Property
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
        let barButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(barButtonAction))
        navigationItem.setRightBarButton(barButton, animated: true)
        view.addSubview(readerTextView)
    }
}

extension ReaderViewController: ReaderDelegate {
    func changeFont(font: UIFont) {
        readerTextView.font = font
    }
    
    func changeTheme(isChange: Bool) {
        if isChange {
            readerTextView.backgroundColor = .black
            guard readerTextView.textColor == .black else { return }
            readerTextView.textColor = .white
        } else {
            readerTextView.backgroundColor = .white
            guard readerTextView.textColor == .white else { return }
            readerTextView.textColor = .black
        }
    }
    
    func textColor(color: UIColor) {
        readerTextView.textColor = color
    }
    
}
