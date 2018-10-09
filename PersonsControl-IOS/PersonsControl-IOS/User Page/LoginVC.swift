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
import Fabric
import Crashlytics
class LoginVC: UIViewController,GIDSignInUIDelegate, GIDSignInDelegate,UITextFieldDelegate {
    
    
    @IBAction func tapGlaz(_ sender: Any) {
        
        if(passwordLabel.isSecureTextEntry == true )
        {
        passwordLabel.isSecureTextEntry = false
        }else
        {
            passwordLabel.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var GoogleSignIn: GIDSignInButton!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    //Create Activity Indicator
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordLabel.delegate = self
        self.emailLabel.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        //Looks for single or multiple taps.
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        myActivityIndicator.center = view.center
        view.addSubview(myActivityIndicator)
        
        if let data = UserDefaults.standard.data(forKey: "User") {
            print("yep")
        
            let dataUser  = (NSKeyedUnarchiver.unarchiveObject(with: data) as! User)
            
            if(dataUser.token != nil && dataUser.id != nil)
            {
                SingletonManager.sharedCenter.UserClass = dataUser
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                self.present(nextVC!, animated: false, completion: nil)
                let home =  UserTaskVC()
                home.setFaceID_TouchID(true)
               // self.navigationController?.pushViewController(nextVC!, animated: true)
                
            }  
        }
        else{
            //neeed fix
           print("error")
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
  
    
    @IBAction func LoginButton(_ sender: Any) {
        myActivityIndicator.startAnimating()
        ServiceApiPost.SingIn(email: emailLabel.text!, password: passwordLabel.text!,loginComplete: { (success, loginError) in
                        if success {
                            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                            self.present(nextVC!, animated: true, completion: nil)
                            print("Login access")
                            self.myActivityIndicator.stopAnimating()
                            let home =  UserTaskVC()
                            home.setFaceID_TouchID(true)
                        } else {
                            DispatchQueue.main.async {
                               
                                self.alertLabel.isHidden = false
                                self.myActivityIndicator.stopAnimating()
                                self.AlertMessage()
                            }
                        }
                    })
    }// login buuton
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        myActivityIndicator.startAnimating()
        if error != nil {
            // ...
            print("error connect ",error as Any)
            self.myActivityIndicator.stopAnimating()
            AlertMessage()
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
                self.myActivityIndicator.stopAnimating()
                self.AlertMessage()
                return
            }else
            {
                let fullName = user.profile.name
                let email = user.profile.email
                
                ServiceApiPost.GoogleSingIn(email: email!, phone: "", name: fullName!,loginComplete: { (success, loginError) in
                    if success {
                        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                        self.present(nextVC!, animated: true, completion: nil)
                        print("Login with Google")
                        self.myActivityIndicator.stopAnimating()
                        let home =  UserTaskVC()
                        home.setFaceID_TouchID(true)
                    } else {
                        DispatchQueue.main.async {
                             self.alertLabel.isHidden = false
                            self.myActivityIndicator.stopAnimating()
                            self.AlertMessage()
                        }
                    }
                })
            }
        }
    }// google signIn
    
    @IBAction func acquireToken(_ sender:UIButton) {
                myActivityIndicator.startAnimating()
            
    }//microsoft singin
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        func AlertMessage()
        {
            let alert = UIAlertController(title: "Login fail", message: "Please try Again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
            
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
    


}

