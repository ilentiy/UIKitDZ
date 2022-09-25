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
        let rootViewController = RegistrationViewController()
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
}
