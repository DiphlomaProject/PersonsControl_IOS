//
//  DataManager.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 08.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class User: NSObject,NSCoding
{
    
//    var id: Int
//    var token : String
//    var UserName : String
//    var DisplayName : String
//    var Email : String
//    var EmailConfirmed : Bool
//    var Address : String
//    var City : String
//    var PhoneNumber : String
//    var RoleName : [String]
    
//    init(id: Int,token : String,UserName : String,DisplayName : String,Email : String,EmailConfirmed : Bool,Address : String,PhoneNumber : String,RoleName : [String],City : String) {
//        self.id = id
//        self.token = token
//        self.UserName = UserName
//        self.DisplayName = DisplayName
//        self.Email = Email
//        self.EmailConfirmed = EmailConfirmed
//        self.Address = Address
//        self.City = City
//        self.PhoneNumber = PhoneNumber
//        self.RoleName = RoleName
//       // var dataManager : User =  UserDefaults.standard.object(forKey: "dataManager")
//
//    }
    override init() {
        
    }
    func encode(with aCoder: NSCoder) {
        //UserDefaults.standard.set(User, forKey: "User")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
//       //User = UserDefaults.standard.dictionary(forKey: "User")
//        let id = aDecoder.decodeInteger(forKey: "id")
//        let token = aDecoder.decodeInteger(forKey: "token")
//        let UserName = aDecoder.decodeInteger(forKey: "UserName")
//        let DisplayName = aDecoder.decodeInteger(forKey: "DisplayName")
//        let Email = aDecoder.decodeInteger(forKey: "Email")
//        let EmailConfirmed = aDecoder.decodeInteger(forKey: "EmailConfirmed")
//        let Address = aDecoder.decodeInteger(forKey: "Address")
//        let City = aDecoder.decodeInteger(forKey: "City")
//        let PhoneNumber = aDecoder.decodeInteger(forKey: "PhoneNumber")
//        let RoleName = aDecoder.decodeInteger(forKey: "RoleName")
//        self.init(id: id, token: token, UserName: UserName, DisplayName: DisplayName, Email: Email, EmailConfirmed: EmailConfirmed, Address: Address, PhoneNumber: PhoneNumber, RoleName: RoleName, City: City)
    }

     func dataValue(dictionary:NSMutableDictionary) ->()
     {
      //  self.User = dictionary as? Dictionary<String, Any>
        
       // UserDefaults.standard.set(self, forKey: "dataManager") //setObject
        print(dictionary)
        
    }
    
    
}
//resultDictionary.setValue(jsonData.data?.id, forKey: "Id")
//resultDictionary.setValue(jsonData.token, forKey: "token")
//resultDictionary.setValue(jsonData.data?.userName, forKey: "UserName")
//resultDictionary.setValue(jsonData.data?.img, forKey: "img")
//resultDictionary.setValue(jsonData.data?.displayName, forKey: "DisplayName")
//resultDictionary.setValue(jsonData.data?.email, forKey: "Email")
//resultDictionary.setValue(jsonData.data?.emailConfirmed, forKey: "EmailConfirmed")
//resultDictionary.setValue(jsonData.data?.address, forKey: "Address")
//resultDictionary.setValue(jsonData.data?.city, forKey: "City")
//resultDictionary.setValue(jsonData.data?.country, forKey: "Country")
//resultDictionary.setValue(jsonData.data?.phoneNumber, forKey: "PhoneNumber")
//(jsonData.data?.roles)!.forEach{ item in
//    resultDictionary.setValue(item.userId, forKey: "RoleUserId")
//    resultDictionary.setValue(item.roleId, forKey: "RoleId")
