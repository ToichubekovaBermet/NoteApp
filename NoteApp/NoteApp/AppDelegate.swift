//
//  AppDelegate.swift
//  NoteApp
//
//  Created by Bermet Toichubekova on 28/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let navigationController = UINavigationController()
            let viewController = NotesListViewController()
            viewController.viewModel = NotesListViewModel()
            navigationController.viewControllers = [viewController]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }

  

}


