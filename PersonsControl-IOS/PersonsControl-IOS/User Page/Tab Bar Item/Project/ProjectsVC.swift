//
//  ProjectsVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class ProjectsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        ServiceApiPost.GetProjectsUser(Complete: { (success, loginError) in
            if success {
                for key in SingletonManager.sharedCenter.contentProject
                {
                    
                    print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).title as Any )
                    
                    
                    print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).desc as Any )
                    
                    print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).customerInfo?.company as Any)
                    
                     print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).customerInfo?.contactPerson as Any)
                    
                     print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).untilTime as Any )
                    
                    print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).beginTime as Any )
                    
                    print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).priceInDollars as Any )
                    
                    print((SingletonManager.sharedCenter.contentProject.object(forKey: key.key) as! UserProject).GroupInfo as Any)
                }
                ////
                
                // self.ReloadData()
              
                
            } else {
                DispatchQueue.main.async {
                   
                    
                }
            }
        })

    }
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
      fatalError("CRASH")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

