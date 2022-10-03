//
//  SceneDelegate.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let rootViewController = TextSettingsViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        let tabBarViewController = UITabBarController()
        tabBarViewController.setViewControllers([navigationController], animated: true)
        window?.rootViewController = tabBarViewController
        window?.makeKeyAndVisible()
    }
}
