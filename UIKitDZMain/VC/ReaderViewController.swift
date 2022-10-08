//
//  ReaderViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 05.10.2022.
//

import UIKit

protocol ReaderDelegate: AnyObject {
    func changeFont(font: UIFont)
    func changeFontWeight(weight: UIFont)
    func changeTheme(isChange: Bool)
    func textColor(color: UIColor)
}

// MARK: - Constants
enum Constants {
    static let labelText = "A"
    static let defaultFontName = "Helvetica"
    static let defaulttFontSize: CGFloat = 20
    static let settingButtonImageName = "gearshape"
    static let text = """
        Я покинул родимый дом,
        Голубую оставил Русь.
        В три звезды березняк над прудом
        Теплит матери старой грусть.
        
        Золотою лягушкой луна
        Распласталась на тихой воде.
        Словно яблонный цвет, седина
        У отца пролилась в бороде.
        
        Я не скоро, не скоро вернусь!
        Долго петь и звенеть пурге.
        Стережет голубую Русь
        Старый клен на одной ноге.
        
        И я знаю, есть радость в нем
        Тем, кто листьев целует дождь,
        Оттого, что тот старый клен
        Головой на меня похож.
        """
}
/// Экран читалки
final class ReaderViewController: UIViewController {
    
    // MARK: - Visual Components
    private lazy var readerTextView: UITextView = {
        let textView = UITextView()
        textView.text = Constants.text
        textView.textColor = .black
        textView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        textView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        textView.font = UIFont(name: Constants.defaultFontName, size: Constants.defaulttFontSize)
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Action
    @objc private  func barButtonAction() {
        let settingsViewController = SettingsViewController()
        settingsViewController.delegate = self
        settingsViewController.view.backgroundColor = readerTextView.backgroundColor
        settingsViewController.setupTheme()
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

/// extension
extension ReaderViewController {
    
    // MARK: - Private Methods
    private func setupUI() {
        let barButton = UIBarButtonItem(image: UIImage(systemName: Constants.settingButtonImageName),
                                        style: .plain,
                                        target: self,
                                        action: #selector(barButtonAction))
        navigationItem.setRightBarButton(barButton, animated: true)
        view.addSubview(readerTextView)
    }
}

/// ReaderDelegate
extension ReaderViewController: ReaderDelegate {
    func changeFontWeight(weight: UIFont) {
        readerTextView.font = weight
    }
    
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
