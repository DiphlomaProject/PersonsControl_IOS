//
//  GroupsVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class GroupsVC: UIViewController {
    
   // var contentGroup = NSMutableDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceApiPost.GetGroupsUser(Complete: { (success, loginError) in
            if success {
                
               
                
//      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).title ?? "error" )
//      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).desc ?? "error" )
//      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).ownerInfo?.displayName ?? "error" )
                for key in SingletonManager.sharedCenter.contentGroup {
//                    print(key.key)
                    
                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).title ?? "error" )
                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).desc ?? "error" )
                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).ownerInfo?.displayName ?? "error" )
                    }
                
//     for test in (SingletonManager.sharedCenter.contentGroup.allKeys as! Group as Any)
//     {
//        print(((test as! Group).title) as Any)
//        print(((test as! Group).desc) as Any)
//        print(((test as! Group).ownerInfo?.displayName) as Any)
 
            
             // SingletonManager.sharedCenter.contentGroup.allKeys
            } else {
                DispatchQueue.main.async {
                    
                    
                }
            }
        })
      
       
      //  print((resultDictionary.object(forKey: "25") as! Group).title)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
       
    }
}
