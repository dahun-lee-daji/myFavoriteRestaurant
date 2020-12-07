//
//  AppDelegate.swift
//  PersonalHiddenGem
//
//  Created by James Kim on 8/5/20.
//  Copyright © 2020 FastCampus. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDesctiption, error) in
                                       if let error = error as NSError? {
                                       //place this implementation with code to habdle theerror appropriately
                                       
                                       /*
                                        Typical reasons for an error here include:
                                         * 부모 경로 누락, 만들수 없음, 쓰기 비허가 상태
                                         * 영구 저장소 접근할 수 없음, 장치가 잠금되었을 때 접근허가 또는 데이터 보호 문제
                                         * 용량 부족
                                         * The store가 현재 모델 버전에 migrate 할 수 없음
                                       */
                                        //fatalError("Unresolved error \(error), \(error.userInfo)")
                                         
                                       }
                                   }
        )
        return container
        
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch{
                // 에러 잡는 구문으로 바꾸기
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
        
    }


}

