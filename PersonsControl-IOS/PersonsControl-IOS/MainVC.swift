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

    @IBAction func SignOut(_ sender: Any) {
        try! Auth.auth().signOut()
        print("logout")
        if self.storyboard != nil {
        //    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginVC") as? ViewController
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var givenNameLabel: UILabel!
    @IBOutlet weak var TokenLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idLabel.text! = SingletonManager.sharedCenter.userId
        self.TokenLabel.text! = SingletonManager.sharedCenter.idToken
        self.nameLabel.text! = SingletonManager.sharedCenter.fullName
        self.givenNameLabel.text! =  SingletonManager.sharedCenter.givenName
        self.familyNameLabel.text! = SingletonManager.sharedCenter.familyName
        self.emailLabel.text! = SingletonManager.sharedCenter.email
        // Do any additional setup after loading the view.
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
