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
    
}


