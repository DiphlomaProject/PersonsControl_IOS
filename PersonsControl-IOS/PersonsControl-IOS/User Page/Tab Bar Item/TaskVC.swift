//
//  TaskVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn
import LocalAuthentication
class TaskVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  TouchID()
      //  setFlagEthernet(true)
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func setFlagEthernet(_ flag: Bool) {
       TouchID()
    }

    func TouchID()
    {
        let context = LAContext()
        context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "Please authenticate to proceed.") { [weak self] (success, error) in
            
            guard success else {
                DispatchQueue.main.async() {
                    // show something here to block the user from continuing
                    print("error")
                    //self?.TouchID()
                    let home =  TaskVC()
                    home.setFlagEthernet(true)
                }
                
                return
            }
            
            DispatchQueue.main.async() {
            
                
                DispatchQueue.main.async {
                    
                   
                     print("Enter access")
                }
                
                
                // do something here to continue loading your app, e.g. call a delegate method
            }
        }
        
    }
}

