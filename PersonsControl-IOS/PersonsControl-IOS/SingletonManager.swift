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
    private init() { }
    
    // MARK: Shared Instance
    
   static let sharedCenter = SingletonManager()
    
    // MARK: Local Variable
    //Google ingo account
    var userId = ""                
    var idToken = ""
    var fullName = ""
    var givenName = ""
    var familyName = ""
    var email = ""
    
    // Configurations Microsoft Identity
    let AUTHORITY_URL = "https://login.microsoftonline.com/common" //COMMON OR YOUR TENANT ID
    let CLIENT_ID = "a4ded5c0-25ac-4cf9-b281-72056aa24159" //This is your client ID
    let REDIRECT_URI = "http://localhost" //This is your redirect URI
    
}


