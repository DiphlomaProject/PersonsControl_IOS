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
    
    //Create Activity Indicator
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    //userDefaults
    let userDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        myActivityIndicator.center = view.center
        view.addSubview(myActivityIndicator)
    }
    @IBAction func RegBtn(_ sender: Any) {
        ServiceApiPost.SingUp(email: email.text!, password: password.text!,userName: userName.text!,phone: phone.text!,regComplete: { (success, loginError) in
            if success {
                print("Registration Complete")
                self.myActivityIndicator.startAnimating()
                
                //Else reg complete call fun login
                ServiceApiPost.SingIn(email: self.email.text!, password: self.password.text!,loginComplete: { (success, loginError) in
                    if success {
                      
                        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                        self.present(nextVC!, animated: true, completion: nil)
                        print("Login access")
                        self.myActivityIndicator.stopAnimating()
//                        //TaskVC.setFlagEthernet(false)
//                        let home =  TaskVC()
//                        home.setFlagEthernet(false)
                    } else {
                        DispatchQueue.main.async {
                            self.myActivityIndicator.stopAnimating()
                            self.AlertMessageLogin()
                        }
                    }
                })
            } else {
                DispatchQueue.main.async {
                    self.myActivityIndicator.stopAnimating()
                    self.AlertMessage()
                }
            }
        })
        
    }
    
    func AlertMessage()
    {
        let alert = UIAlertController(title: "Registration  false", message: "Please try Again", preferredStyle: UIAlertControllerStyle.alert)
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
    
    func AlertMessageLogin()
    {
        let alert = UIAlertController(title: "Login  error", message: "Please try Again", preferredStyle: UIAlertControllerStyle.alert)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
