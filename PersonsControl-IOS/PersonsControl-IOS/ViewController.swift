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
                    && result!.error.code == ADErrorCode.ERROR_UNEXPECTED.rawValue {
                    
                    //   self.updateStatusField("Unexpected internal error occured");
                    
                } else {
                    
                    //  self.updateStatusField(result!.error.description)
                }
                
                return;
            }
            
            var expiresOnString = "(nil)"
            
            if let expiresOn = result!.tokenCacheItem.expiresOn {
                expiresOnString = String(describing: expiresOn)
            }
            
            let status = String(format: "Access token: %@\nexpiration:%@", result!.accessToken, expiresOnString)
            //self.updateStatusField(status)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

