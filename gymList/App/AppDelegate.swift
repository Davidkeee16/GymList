//
//  AppDelegate.swift
//  gymList
//
//  Created by David Puksanskis on 09/07/2025.
//

import CoreData
import UIKit


@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExerciseEntity")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError()
            }
        }
        return container
    } ()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        window.rootViewController = TabBarViewController()
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }
}
