//
//  MoreVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class MoreVC: UIViewController
{
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func SignOut(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "User")
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        //self.navigationController?.popToViewController(nextVC!, animated: true)
         self.navigationController?.pushViewController(nextVC!, animated: true)
//        for key in SingletonManager.sharedCenter.contentGroup
//        {
//            SingletonManager.sharedCenter.contentGroup.setNilValueForKey(key.key as! String)
//        }
        SingletonManager.sharedCenter.contentGroup.removeAllObjects()
        print(SingletonManager.sharedCenter.contentGroup)
//        print(SingletonManager.sharedCenter.contentGroup)
       // self.present(nextVC!, animated: true, completion: nil)
    //   self.navigationController?.popToRootViewController(animated: true)
        
        try! Auth.auth().signOut()
        print("logout")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
