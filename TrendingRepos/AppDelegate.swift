//
//  AppDelegate.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let request = APIRequest.searchRepositoriesByStars(page: 20, fromDate: Date.thirtyDaysBeforeToday)
        
        print(request.request()?.url?.absoluteURL)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainNavigationController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
