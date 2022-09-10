//
//  AppDelegate.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static var standard: AppDelegate {
           return UIApplication.shared.delegate as! AppDelegate
       }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor = Colors.appColor.uiColor()
            
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        else{
            let navBarAppearance = UINavigationBar.appearance()
            navBarAppearance.tintColor = .gray
            navBarAppearance.isTranslucent = false
            
            navBarAppearance.barTintColor = Colors.appColor.uiColor()
                
            navBarAppearance.isOpaque = true

            navBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white]
            
        }
        */
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let vc:NewsListVC = NewsListVC()
        let navController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

