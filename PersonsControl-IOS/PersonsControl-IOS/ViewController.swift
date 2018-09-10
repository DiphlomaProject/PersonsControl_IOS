//
//  ViewController.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 14.08.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import ADAL
//import PlaygroundSupport
class ViewController: UIViewController,GIDSignInUIDelegate {
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBAction func LoginButton(_ sender: Any) {
        
      //  GoogleSingInApiPOST.SingIn(email: emailLabel.text!, password: passwordLabel.text!)
//        Service.instance.loginUser(withUserName: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
//            if success {
//                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextVC")
//                self.present(nextVC!, animated: true, completion: nil)
//            } else {
//                DispatchQueue.main.async {
//                    self.alertLbl.isHidden = false
//                }
//            }
//        })
        
        ServiceApiPost.SingIn(email: emailLabel.text!, password: passwordLabel.text!,loginComplete: { (success, loginError) in
                        if success {
//                            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
//                            self.present(nextVC!, animated: true, completion: nil)
                          
                            print("Login access")
                        } else {
                            DispatchQueue.main.async {
//                                self.alertLbl.isHidden = false
                                print("login false")
                            }
                        }
                    })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    @IBAction func acquireToken(_ sender:UIButton) {
        let authContext = ADAuthenticationContext(authority: SingletonManager.sharedCenter.AUTHORITY_URL,
                                                  error: nil)
        
        authContext!.acquireToken(withResource: "hmsala4b7974c-4a7c-475e-91b8-a82d67b0d9a8://auth",
                                  clientId: SingletonManager.sharedCenter.CLIENT_ID,
                                  redirectUri: URL(string: SingletonManager.sharedCenter.REDIRECT_URI))
        {
            (result) in
            
            if (result!.status != AD_SUCCEEDED)
            {
                if result!.error.domain == ADAuthenticationErrorDomain
                    && result!.error.code == ADErrorCode.ERROR_UNEXPECTED.rawValue {} else {
                }
                return;
            }
            
            var expiresOnString = "(nil)"
            
            if let expiresOn = result!.tokenCacheItem.expiresOn {
                expiresOnString = String(describing: expiresOn)
            }
            
            let status = String(format: "Access token: %@\nexpiration:%@", result!.accessToken, expiresOnString)

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

