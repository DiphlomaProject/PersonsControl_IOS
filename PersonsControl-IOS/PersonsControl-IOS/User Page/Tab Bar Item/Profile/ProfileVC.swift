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

class ProfileVC: UIViewController {

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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
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
            //self.myactivityindecator.startAnimating()
            
            
         
           
        }
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, urlCredential)
    }

}

