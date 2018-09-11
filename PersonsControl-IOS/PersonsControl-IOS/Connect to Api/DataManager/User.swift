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
    var id: Int
    var token : String
    var UserName : String
    var DisplayName : String
    var Email : String
    var EmailConfirmed : Bool
    var Address : String
    var City : String
    var Country : String
    var PhoneNumber : String
    var RoleName : [String]
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encodeCInt(Int32(id), forKey: "id")
        aCoder.encode(token,forKey: "token")
        aCoder.encode(UserName,forKey: "UserName")
        aCoder.encode(Email,forKey: "Email")
        aCoder.encode(EmailConfirmed,forKey: "EmailConfirmed")
        aCoder.encode(Address,forKey: "Address")
        aCoder.encode(City,forKey: "City")
        aCoder.encode(PhoneNumber,forKey: "PhoneNumber")
        aCoder.encode(RoleName,forKey: "RoleName")
        aCoder.encode(DisplayName,forKey: "DisplayName")
        aCoder.encode(Country,forKey: "Country")
    }
    
    required  init?(coder aDecoder: NSCoder) {
     
        self.id = aDecoder.decodeObject(forKey: "id") as! Int
        self.token = aDecoder.decodeObject(forKey: "token") as! String
        self.UserName = aDecoder.decodeObject(forKey: "UserName") as! String
        self.Email = aDecoder.decodeObject(forKey: "Email") as! String
        self.EmailConfirmed = aDecoder.decodeObject(forKey: "EmailConfirmed") as! Bool
        self.Address = aDecoder.decodeObject(forKey: "Address") as! String
        self.City = aDecoder.decodeObject(forKey: "City") as! String
        self.Country = aDecoder.decodeObject(forKey: "Country") as! String
        self.PhoneNumber = aDecoder.decodeObject(forKey: "PhoneNumber") as! String
        self.RoleName = aDecoder.decodeObject(forKey: "RoleName") as! [String]
        self.DisplayName = aDecoder.decodeObject(forKey: "DisplayName") as! String
    }
    
    func dataSave(dictionary:NSMutableDictionary) ->()
    {
//        let data  = NSKeyedArchiver.archivedData(withRootObject: dictionary)
//        let defaults = UserDefaults.standard
//        defaults.set(data, forKey:"User" )
        print(dictionary)
        
    }
}
