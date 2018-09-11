//
//  DataManager.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 08.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class User : NSObject,NSCoding
{
    var id: String?
    var token : String?
    var UserName : String?
    var DisplayName : String?
    var Email : String?
    var EmailConfirmed : Bool?
    var Address : String?
    var City : String?
    var Country : String?
    var PhoneNumber : String?
    var RoleName : [String]?
    
    init(json: NSMutableDictionary) { // Dictionary object
        self.id = (json["id"] as? String)
        self.token = (json["token"] as? String)
        self.UserName = (json["UserName"] as? String)
        self.DisplayName = (json["DisplayName"] as? String)
        self.Email = (json["Email"] as? String)
        self.EmailConfirmed = (json["EmailConfirmed"] as? Bool)
        self.Address = (json["Address"] as? String)
        self.City = (json["City"] as? String)
        self.Country = (json["Country"] as? String)
        self.PhoneNumber = (json["PhoneNumber"] as? String)
        self.RoleName = [(json["RoleName"] as? String)] as? [String]// Location of the JSON file
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = (aDecoder.decodeObject(forKey: "id") as? String)
        self.token = (aDecoder.decodeObject(forKey: "token") as? String)
        self.UserName = (aDecoder.decodeObject(forKey: "UserName") as? String)
        self.DisplayName = (aDecoder.decodeObject(forKey: "DisplayName") as? String)
        self.Email = (aDecoder.decodeObject(forKey: "Email") as? String)!
        self.EmailConfirmed = (aDecoder.decodeObject(forKey: "EmailConfirmed") as? Bool)
        self.City = (aDecoder.decodeObject(forKey: "City") as? String)
        self.Country = (aDecoder.decodeObject(forKey: "Country") as? String)
        self.PhoneNumber = (aDecoder.decodeObject(forKey: "PhoneNumber") as? String)
        self.RoleName = [(aDecoder.decodeObject(forKey: "RoleName") as? String)] as? [String]
        self.Address = (aDecoder.decodeObject(forKey: "Address") as? String)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.token, forKey: "token")
        aCoder.encode(self.UserName, forKey: "UserName")
        aCoder.encode(self.DisplayName, forKey: "DisplayName")
        aCoder.encode(self.Email, forKey: "Email")
        aCoder.encode(self.EmailConfirmed, forKey: "EmailConfirmed")
        aCoder.encode(self.City, forKey: "City")
        aCoder.encode(self.Country, forKey: "Country")
        aCoder.encode(self.PhoneNumber, forKey: "PhoneNumber")
        aCoder.encode(self.RoleName, forKey: "RoleName")
        aCoder.encode(self.Address, forKey: "Address")
    }

    func dataSave(dictionary:NSMutableDictionary) ->()
    {
//        let data  = NSKeyedArchiver.archivedData(withRootObject: dictionary)
//        let defaults = UserDefaults.standard
//        defaults.set(data, forKey:"User" )
        print(dictionary)
        
    }
}

//
