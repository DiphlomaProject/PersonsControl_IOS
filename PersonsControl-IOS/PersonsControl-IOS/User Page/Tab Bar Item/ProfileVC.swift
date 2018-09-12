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
       
            imgProf.layer.cornerRadius = imgProf.frame.size.width/2
            imgProf.clipsToBounds = true
            displayName.text = SingletonManager.sharedCenter.UserClass?.DisplayName
            email.text = SingletonManager.sharedCenter.UserClass?.Email
            Role.text = SingletonManager.sharedCenter.UserClass?.RoleName
            Phone.text = SingletonManager.sharedCenter.UserClass?.PhoneNumber
            address.text = SingletonManager.sharedCenter.UserClass?.Address
            city.text = SingletonManager.sharedCenter.UserClass?.City
            Country.text = SingletonManager.sharedCenter.UserClass?.Country
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}
