//
//  ConstraintViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 16.10.2022.
//

import UIKit

/// Светофор констрейнтами
final class ConstraintViewController: UIViewController {
    
    // MARK: - Visual Components
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
    
   private  func createRedViewConstraint() {
        NSLayoutConstraint(item: redView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: redView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 0.55,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: redView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: redView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
   private func createYellowViewConstraint() {
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 0.2,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
   private func createGreenViewConstraint() {
        NSLayoutConstraint(item: greenView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: greenView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1.45,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: greenView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .height,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: greenView,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
    
   private func createBlackViewConstraint() {
        NSLayoutConstraint(item: blackView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: blackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: blackView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .width,
                           multiplier: 1.25,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: blackView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .width,
                           multiplier: 2.8,
                           constant: 0).isActive = true
    }
}
