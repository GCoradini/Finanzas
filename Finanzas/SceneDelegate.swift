//
//  SceneDelegate.swift
//  Finanzas
//
//  Created by MAC on 26/07/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootViewController = LoginViewController()
        window.rootViewController = UINavigationController(
            rootViewController: rootViewController
        )
        window.makeKeyAndVisible()
        self.window = window
    }
}
