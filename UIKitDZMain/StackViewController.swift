//
//  StackViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 16.10.2022.
//

import UIKit

/// Stack View светофор
final class StackViewController: UIViewController {

    // MARK: - Private Visual Components
    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = .black
        view.distribution = .fillProportionally
        view.spacing = 25
        view.layoutMargins = .init(top: 25, left: 25, bottom: 25, right: 25)
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redrawSpace()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.35).isActive = true
    }
    
    private func redrawSpace() {
        let size = stackView.frame.width * 0.1
        stackView.spacing = size
        stackView.layoutMargins = .init(top: size, left: size, bottom: size, right: size)
        stackView.isLayoutMarginsRelativeArrangement = true
    }
}
