//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Vjeran Hanzek on 30/03/2019.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let loginController = LoginViewController()
    private let quizzesController = QuizzesViewController(viewModel: QuizzesViewModel())
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = AuthorizationUtils.isUserLoggedIn() ?
            UINavigationController(rootViewController: quizzesController) : loginController
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func switchToLoginController() {
        self.window?.rootViewController = loginController
    }
    
    func switchToQuizzesController() {
        self.window?.rootViewController = UINavigationController(
            rootViewController: quizzesController)
    }


}

