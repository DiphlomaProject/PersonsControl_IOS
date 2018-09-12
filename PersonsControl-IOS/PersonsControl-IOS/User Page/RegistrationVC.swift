//
//  RegistrationVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
class RegistrationVC: UIViewController
{
    @IBOutlet weak var email: UITextField!
     @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confrimPassword: UITextField!
   
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    @IBAction func RegBtn(_ sender: Any) {
        ServiceApiPost.SingUp(email: email.text!, password: password.text!,userName: userName.text!,phone: phone.text!,regComplete: { (success, loginError) in
            if success {
//                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
//                self.present(nextVC!, animated: true, completion: nil)
                print("Login access")
//                self.myActivityIndicator.stopAnimating()
            } else {
                DispatchQueue.main.async {
//                    self.alertLabel.isHidden = false
//                    self.myActivityIndicator.stopAnimating()
                    print("login false")
                }
            }
        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
