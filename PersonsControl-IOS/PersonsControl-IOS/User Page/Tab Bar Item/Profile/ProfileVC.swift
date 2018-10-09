//
//  MainVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 14.08.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class ProfileVC: UIViewController,UITextFieldDelegate {
 @IBOutlet weak var menubtn: UIBarButtonItem!
    @IBOutlet weak var displayName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var Role: UITextField!
    
    @IBOutlet weak var Phone: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var Country: UITextField!
    @IBOutlet weak var imgProf: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil
        {
            menubtn.target = self.revealViewController()
            menubtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.email.delegate = self
        self.Role.delegate = self
        self.displayName.delegate = self
        self.Phone.delegate = self
        self.address.delegate = self
        self.city.delegate = self
        self.Country.delegate = self
    }
   
    override func viewWillAppear(_ animated: Bool) {
        
        self.imgProf.layer.cornerRadius = self.imgProf.frame.size.width/2
        self.imgProf.clipsToBounds = true
        self.displayName.text = SingletonManager.sharedCenter.UserClass?.DisplayName
        self.email.text = SingletonManager.sharedCenter.UserClass?.Email
        self.Role.text = SingletonManager.sharedCenter.UserClass?.RoleName
        self.Phone.text = SingletonManager.sharedCenter.UserClass?.PhoneNumber
        self.address.text = SingletonManager.sharedCenter.UserClass?.Address
        self.city.text = SingletonManager.sharedCenter.UserClass?.City
        self.Country.text = SingletonManager.sharedCenter.UserClass?.Country
        self.imgProf.image = SingletonManager.sharedCenter.ImageProfile
       
    }
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, urlCredential)
    }
    
    /**
     keyboard
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func Save(_ sender: Any) {
        let name = self.displayName.text
        let address = self.address.text
        let phone = self.Phone.text
        let city = self.city.text
        let country = self.Country.text
        
        ServiceApiPost.UpdateInfoUser(id:(SingletonManager.sharedCenter.UserClass?.id)!,token:(SingletonManager.sharedCenter.UserClass?.token)!,DisplayName: name!,Address: address!,phone : phone!, Country: country!, City: city! ,UpdateComplete: { (success, loginError) in
            if success {
//                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
//                self.present(nextVC!, animated: true, completion: nil)
//                print("Login access")
//                self.myActivityIndicator.stopAnimating()
//                let home =  UserTaskVC()
//                home.setFaceID_TouchID(true)
                print("okay")
            } else {
                DispatchQueue.main.async {
//
//                    self.alertLabel.isHidden = false
//                    self.myActivityIndicator.stopAnimating()
//                    self.AlertMessage()
                }
            }
        })
        
    }
    

}

