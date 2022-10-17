//
//  AnchorViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 16.10.2022.
//

import UIKit

/// Светофор якорями
final class AnchorViewController: UIViewController {
    
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
    
    private let blackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        
        createRedViewConstraint()
        createYellowViewConstraint()
        createGreenViewConstraint()
        createBlackViewConstraint()
    }
    
   private func createRedViewConstraint() {
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
           .constraint(equalTo: yellowView.heightAnchor, multiplier: 1.125).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
    }
    
    private func createYellowViewConstraint() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
    
   private func createGreenViewConstraint() {
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
            .constraint(equalTo: yellowView.heightAnchor, multiplier: -1.125).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor).isActive = true
    }
    
    private func createBlackViewConstraint() {
        blackView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true
        blackView.widthAnchor.constraint(equalTo: yellowView.widthAnchor, multiplier: 1.25).isActive = true
        blackView.heightAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 2.8).isActive = true
     }
}
