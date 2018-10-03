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
        
        
        ServiceApiPost.GetTasksUser(Complete: { (success, loginError) in
            if success {

                print("tasks")

            } else {
                DispatchQueue.main.async {
                            print("error")
                }
            }
        })
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func setFaceID_TouchID(_ flag: Bool) {
       TouchID()
    }

    func TouchID()
    {
        let context : LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate to proceed.", reply: { ( wasCorrect, error) in
                if wasCorrect
                {
                    print("access")
                }else
                {
                    print("error")
                    let home =  TaskVC()
                    home.setFaceID_TouchID(true)
                }
            })
        }else
        {
            //else
         print("no used")
        }
    }
    
    
}


