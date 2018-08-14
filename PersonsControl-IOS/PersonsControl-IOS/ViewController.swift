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
class ViewController: UIViewController,GIDSignInUIDelegate {
@IBOutlet weak var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        //  GIDSignIn.sharedInstance().signIn()
        // setupGoogleButtons()
        // Do any additional setup after loading the view, typically from a nib.
    }

/* fileprivate func setupGoogleButtons()
    { // создаем кнопку гугла
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x:60,y:500, width:view.frame.width - 115, height :50)
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance()?.uiDelegate = self
    }
    */
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

