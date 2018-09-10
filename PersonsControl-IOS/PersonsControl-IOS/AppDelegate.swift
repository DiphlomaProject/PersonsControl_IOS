//
//  AppDelegate.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 14.08.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate,UINavigationControllerDelegate {


    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
       
        // Override point for customization after application launch.
        return true
    }
   
 
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if error != nil {
            // ...
            print("error connect ",error as Any)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let err = error {
                // ...
                print("error connect ",err)
                return
            }else
            {
//                let userId = user.userID                  // For client-side use only!
//                let idToken = user.authentication.idToken  // Safe to send to the server
                let fullName = user.profile.name
//                let givenName = user.profile.givenName
//                let familyName = user.profile.familyName
                let email = user.profile.email
////                SingletonManager.sharedCenter.userId = userId!
////                SingletonManager.sharedCenter.idToken = idToken!
////                SingletonManager.sharedCenter.fullName = fullName!
////                SingletonManager.sharedCenter.givenName = givenName!
////                SingletonManager.sharedCenter.familyName = familyName!
////                SingletonManager.sharedCenter.email = email!
                print("info shared singleton")
                print("login access");
                 //GoogleSingInApiPOST.GoogleSingIn(email: email!, phone: "", name: fullName!)
                ServiceApiPost.GoogleSingIn(email: email!, phone: "", name: fullName!,loginComplete: { (success, loginError) in
                    if success {
//                                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                            let loginPageView = mainStoryboard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
//                                            let rootViewController = self.window!.rootViewController as! UINavigationController
//                                            rootViewController.pushViewController(loginPageView, animated: true)
//                        rootViewController.popToViewController(loginPageView, animated: true)
//                        rootViewController.show(loginPageView, sender: true)
                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let loginPageView = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC")
                        let rootViewController = self.window!.rootViewController as! UINavigationController
                        rootViewController.pushViewController(loginPageView, animated: true)
                        print("Login with Google")
                    } else {
                        DispatchQueue.main.async {
                            //self.alertLbl.isHidden = false
                            
                            print("login false")
                        }
                    }
                })
                
                
                //                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                //                    let loginPageView = mainStoryboard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
                //                    let rootViewController = self.window!.rootViewController as! UINavigationController
                //                    rootViewController.pushViewController(loginPageView, animated: true)
                //rootViewController.popToViewController(loginPageView, animated: true)
                //rootViewController.show(loginPageView, sender: true)               

            }
            // User is signed in
            // ...
         
            
        }
    }
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                     sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: [:])
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PersonsControl_IOS")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
   


}

