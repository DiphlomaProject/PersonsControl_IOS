//
//  RegistrationVC.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 12.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
import UIKit
class RegistrationVC: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confrimPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    
   
    //Create Activity Indicator
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    //userDefaults
    let userDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        self.email.delegate = self
        self.password.delegate = self
        self.confrimPassword.delegate = self
        self.userName.delegate = self
       
        myActivityIndicator.center = view.center
        view.addSubview(myActivityIndicator)
    }
    @IBAction func show_password(_ sender: Any) {
        
        if(password.isSecureTextEntry == true )
        {
            password.isSecureTextEntry = false
        }else
        {
            password.isSecureTextEntry = true
        }
        
    }
    @IBAction func showpassword_confrim(_ sender: Any) {
        if(confrimPassword.isSecureTextEntry == true )
        {
            confrimPassword.isSecureTextEntry = false
        }else
        {
            confrimPassword.isSecureTextEntry = true
        }
        
    }
    @IBAction func RegBtn(_ sender: Any) {
      
        Registration()
        
    }
    
     func Registration()
     {
        if(email.text!.isEmail){
            print("corect")
            if(password.text == confrimPassword.text)
            {
                self.customActivityIndicatory(self.view, startAnimate: true)
                ServiceApiPost.SingUp(email: email.text!, password: password.text!,userName: userName.text!,regComplete: { (success, loginError) in
                    if success {
                        print("Registration Complete")
                        //Else reg complete call fun login
                        ServiceApiPost.SingIn(email: self.email.text!, password: self.password.text!,loginComplete: { (success, loginError) in
                            if success {
                                self.myActivityIndicator.stopAnimating()
                                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                                self.present(nextVC!, animated: true, completion: nil)
                                print("Login access")
                            } else {
                                DispatchQueue.main.async {
                                    self.customActivityIndicatory(self.view, startAnimate: false)
                                    
                                    self.AlertMessage(message: "Login error")
                                }
                            }
                        })
                    } else {
                        DispatchQueue.main.async {
                            self.customActivityIndicatory(self.view, startAnimate: false)
                            self.email.layer.cornerRadius = 8.0
                            self.email.layer.masksToBounds = true
                            self.email.layer.borderColor = UIColor( red: 255, green: 0, blue:0, alpha: 1.0 ).cgColor
                            self.email.layer.borderWidth = 2.0
                            
                            
                        }
                    }
                })
            }else
            {
                print("error")
                
                //password.layer.borderColor = (UIColor.red as! CGColor)
                password.layer.cornerRadius = 8.0
                password.layer.masksToBounds = true
                password.layer.borderColor = UIColor( red: 255, green: 0, blue:0, alpha: 1.0 ).cgColor
                password.layer.borderWidth = 2.0
                //confrimPassword.layer.borderColor = (UIColor.red as! CGColor)
                confrimPassword.layer.cornerRadius = 8.0
                confrimPassword.layer.masksToBounds = true
                confrimPassword.layer.borderColor = UIColor( red: 255, green: 0, blue:0, alpha: 1.0 ).cgColor
                confrimPassword.layer.borderWidth = 2.0
            }
        }
        else{
            print("incorreect")
            AlertMessage(message: "E-mail no-valid")
        }
       
        
    }
    func AlertMessage(message: String)
    {
        let alert = UIAlertController(title: message, message: "Please try Again", preferredStyle: UIAlertControllerStyle.alert)
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
    
    @discardableResult
    func customActivityIndicatory(_ viewContainer: UIView, startAnimate:Bool? = true) -> UIActivityIndicatorView {
        let mainContainer: UIView = UIView(frame: viewContainer.frame)
        mainContainer.center = viewContainer.center
        // mainContainer.backgroundColor = UIColor.init(hexString: "0xFFFFFF")
        mainContainer.backgroundColor = UIColor.init(hexString: "#a2a39f")
        
        mainContainer.alpha = 0.5
        mainContainer.tag = 789456123
        mainContainer.isUserInteractionEnabled = false
        
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x:0,y: 0,width: 80,height: 80))
        viewBackgroundLoading.center = viewContainer.center
        //        viewBackgroundLoading.backgroundColor = UIColor.init(hexString: "0x444444")
        viewBackgroundLoading.backgroundColor = UIColor.init(hexString: "#000000")
        viewBackgroundLoading.alpha = 0.5
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15
        
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.frame = CGRect(x:0.0,y: 0.0,width: 40.0, height: 40.0)
        activityIndicatorView.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicatorView.center = CGPoint(x: viewBackgroundLoading.frame.size.width / 2, y: viewBackgroundLoading.frame.size.height / 2)
        if startAnimate!{
            viewBackgroundLoading.addSubview(activityIndicatorView)
            mainContainer.addSubview(viewBackgroundLoading)
            viewContainer.addSubview(mainContainer)
            activityIndicatorView.startAnimating()
        }else{
            for subview in viewContainer.subviews{
                if subview.tag == 789456123{
                    subview.removeFromSuperview()
                }
            }
        }
        return activityIndicatorView
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
extension String {
    //Validate Email
    
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    //validate Password
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil){
                
                if(self.characters.count>=6 && self.characters.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
}
