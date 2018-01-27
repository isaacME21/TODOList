//
//  AppDelegate.swift
//  TODOList
//
//  Created by Luis Isaac Maya Estrada on 10/01/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        return true
    }


    func applicationWillTerminate(_ application: UIApplication) {
       
    }
    



}

