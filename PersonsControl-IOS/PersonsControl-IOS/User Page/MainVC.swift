//
//  MainVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 14.08.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class MainVC: UIViewController {

  
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var givenNameLabel: UILabel!
    @IBOutlet weak var TokenLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

//        if let data = UserDefaults().data(forKey: "User"),
//            let custom = NSKeyedUnarchiver.unarchiveObject(with: data) as? [User] {
//            // Do something with retrieved data
//            for item in custom {
//                print(item)
//            }
//        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func SignOut(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "User")
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        //self.navigationController?.popToViewController(nextVC!, animated: true)
       // self.navigationController?.pushViewController(nextVC!, animated: true)
        self.present(nextVC!, animated: true, completion: nil)
        try! Auth.auth().signOut()
        print("logout")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
