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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServiceApiPost.GetGroupsUser(Complete: { (success, loginError) in
            if success {
                
                print("groups access")
                
            } else {
                DispatchQueue.main.async {
                    
                    
                }
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
