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
                
                
                
                
                //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).title ?? "error" )
                //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).desc ?? "error" )
                //      print((SingletonManager.sharedCenter.contentGroup.object(forKey: "25") as! Group).ownerInfo?.displayName ?? "error" )
                //                for key in SingletonManager.sharedCenter.contentGroup
                //                {
                //
                //                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).title ?? "error" )
                //
                //
                //                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).desc ?? "error" )
                //                    print((SingletonManager.sharedCenter.contentGroup.object(forKey: key.key) as! Group).ownerInfo?.displayName ?? "error" )
                //                    }
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

