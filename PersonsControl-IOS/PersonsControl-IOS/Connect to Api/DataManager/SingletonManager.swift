//
//  SingletonManager.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 14.08.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class SingletonManager {

    
    // Can't init is singleton
    private init() {
        
    }
    
    // MARK: Shared Instance
    static let sharedCenter = SingletonManager()
    var UserClass : User?
    //Configurations Api
    let SignIn_URL = "https://178.209.88.110:443/api/Users/SignIn"
    let GoogleSignIn_URL = "https://178.209.88.110/api/Users/GoogleSignIn"
    let HelpInfo_URL = "https://178.209.88.110:443/api/RestApiHelper/helpinfo"
    let SignUp_URL = "https://178.209.88.110:443/api/Users/SignUp"
    // Configurations Microsoft Identity
    let AUTHORITY_URL = "https://login.microsoftonline.com/common/oauth2/nativeclient" //COMMON OR YOUR TENANT ID
    let CLIENT_ID = "a4b7974c-4a7c-475e-91b8-a82d67b0d9a8" //This is your client ID
    let REDIRECT_URI = "urn:ietf:wg:oauth:2.0:oob" //This is your redirect URI

}
