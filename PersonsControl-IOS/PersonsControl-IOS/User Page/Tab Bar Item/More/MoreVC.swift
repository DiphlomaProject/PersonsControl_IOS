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

class MoreVC:UITableViewController
{
     @IBOutlet weak var menubtn: UIBarButtonItem!
    override func viewWillAppear(_ animated: Bool) {
       // self.navigationController?.isNavigationBarHidden = false
        // self.navigationItem.title = "More"
        // self.navigationController?.isNavigationBarHidden = true
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController?.isNavigationBarHidden = true
        if self.revealViewController() != nil
        {
            menubtn.target = self.revealViewController()
            menubtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    @IBAction func SignOut(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "User")
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        //self.navigationController?.popToViewController(nextVC!, animated: true)
         self.navigationController?.pushViewController(nextVC!, animated: true)
        
        SingletonManager.sharedCenter.contentGroup.removeAllObjects()
        print(SingletonManager.sharedCenter.contentGroup)
        
        SingletonManager.sharedCenter.contentProject.removeAllObjects()
        print(SingletonManager.sharedCenter.contentProject)
        
        SingletonManager.sharedCenter.contentPersonalTask.removeAllObjects()
        print(SingletonManager.sharedCenter.contentPersonalTask)
        
        SingletonManager.sharedCenter.contentGroupTask.removeAllObjects()
        print(SingletonManager.sharedCenter.contentGroupTask)
        
        
        SingletonManager.sharedCenter.contentProjectTask.removeAllObjects()
        print(SingletonManager.sharedCenter.contentProjectTask)
        
        SingletonManager.sharedCenter.ImageProfile = nil
        try! Auth.auth().signOut()
        print("logout")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
