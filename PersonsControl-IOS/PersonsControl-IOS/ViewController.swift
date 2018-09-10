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
class ViewController: UIViewController,GIDSignInUIDelegate, GIDSignInDelegate {
    
    
    @IBOutlet weak var GoogleSignIn: GIDSignInButton!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    //Create Activity Indicator
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        myActivityIndicator.center = view.center
        view.addSubview(myActivityIndicator)
        
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        myActivityIndicator.startAnimating()
        ServiceApiPost.SingIn(email: emailLabel.text!, password: passwordLabel.text!,loginComplete: { (success, loginError) in
                        if success {
                            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                            self.present(nextVC!, animated: true, completion: nil)
                            print("Login access")
                            self.myActivityIndicator.stopAnimating()
                        } else {
                            DispatchQueue.main.async {
                                self.alertLabel.isHidden = false
                                self.activityProgressStop()
                                print("login false")
                            }
                        }
                    })
    }
    
    

    
     func activityProgressStart()
    {
       myActivityIndicator.startAnimating()
    }
    func activityProgressStop()
    {
        myActivityIndicator.stopAnimating()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        let view = ViewController()
        view.activityProgressStart()
        if error != nil {
            // ...
            print("error connect ",error as Any)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let err = error {
                // ...
                print("error connect ",err)
                return
            }else
            {
                //                let userId = user.userID                  // For client-side use only!
                //                let idToken = user.authentication.idToken  // Safe to send to the server
                let fullName = user.profile.name
                //                let givenName = user.profile.givenName
                //                let familyName = user.profile.familyName
                let email = user.profile.email
                ////                SingletonManager.sharedCenter.userId = userId!
                ////                SingletonManager.sharedCenter.idToken = idToken!
                ////                SingletonManager.sharedCenter.fullName = fullName!
                ////                SingletonManager.sharedCenter.givenName = givenName!
                ////                SingletonManager.sharedCenter.familyName = familyName!
                ////                SingletonManager.sharedCenter.email = email!
                ServiceApiPost.GoogleSingIn(email: email!, phone: "", name: fullName!,loginComplete: { (success, loginError) in
                    if success {
                        //                        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        //                        let loginPageView = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC")
                        //                        let rootViewController = self.window!.rootViewController as! UINavigationController
                        //                        rootViewController.pushViewController(loginPageView, animated: true)
                        print("Login with Google")
                        view.activityProgressStop()
                    } else {
                        DispatchQueue.main.async {
                            print("login false")
                        }
                    }
                })
            }
        }
    }
    
    @IBAction func acquireToken(_ sender:UIButton) {
        //        myActivityIndicator.startAnimating()
        //        let authContext = ADAuthenticationContext(authority: SingletonManager.sharedCenter.AUTHORITY_URL,
        //                                                  error: nil)
        //
        //        authContext!.acquireToken(withResource: "hmsala4b7974c-4a7c-475e-91b8-a82d67b0d9a8://auth",
        //                                  clientId: SingletonManager.sharedCenter.CLIENT_ID,
        //                                  redirectUri: URL(string: SingletonManager.sharedCenter.REDIRECT_URI))
        //        {
        //            (result) in
        //
        //            if (result!.status != AD_SUCCEEDED)
        //            {
        //                if result!.error.domain == ADAuthenticationErrorDomain
        //                    && result!.error.code == ADErrorCode.ERROR_UNEXPECTED.rawValue {} else {
        //                }
        //                return;
        //            }
        //
        //            var expiresOnString = "(nil)"
        //
        //            if let expiresOn = result!.tokenCacheItem.expiresOn {
        //                expiresOnString = String(describing: expiresOn)
        //            }
        //
        //            let status = String(format: "Access token: %@\nexpiration:%@", result!.accessToken, expiresOnString)
        //
        //        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

