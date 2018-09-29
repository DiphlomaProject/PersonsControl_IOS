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
                

      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).title ?? "error" )
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
