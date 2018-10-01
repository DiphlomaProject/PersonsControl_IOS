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
       self.customActivityIndicatory(self.view, startAnimate: true)
        Registration()
        
    }
     func Registration()
     {
        ServiceApiPost.SingUp(email: email.text!, password: password.text!,userName: userName.text!,phone: phone.text!,regComplete: { (success, loginError) in
            if success {
                print("Registration Complete")
                //self.myActivityIndicator.startAnimating()
                
                //Else reg complete call fun login
                ServiceApiPost.SingIn(email: self.email.text!, password: self.password.text!,loginComplete: { (success, loginError) in
                    if success {
                        self.myActivityIndicator.stopAnimating()
                        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                        self.present(nextVC!, animated: true, completion: nil)
                        print("Login access")
//                        // self.myActivityIndicator.stopAnimating()
//                        self.customActivityIndicatory(self.view, startAnimate: false)
                    } else {
                        DispatchQueue.main.async {
                            self.customActivityIndicatory(self.view, startAnimate: false)

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

}
//extension UIColor {
//    convenience init?(hexString: String) {
//        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
//        let red, green, blue, alpha: CGFloat
//        switch chars.count {
//        case 3:
//            chars = chars.flatMap { [$0, $0] }
//            fallthrough
//        case 6:
//            chars = ["F","F"] + chars
//            fallthrough
//        case 8:
//            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
//            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
//            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
//            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
//        default:
//            return nil
//        }
//        self.init(red: red, green: green, blue:  blue, alpha: alpha)
//    }
//}
