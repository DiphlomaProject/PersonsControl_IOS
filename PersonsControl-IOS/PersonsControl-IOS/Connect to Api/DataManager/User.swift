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
    //var User : Dictionary<String, Any>?
    
    required override init() {
       // var dataManager : User =  UserDefaults.standard.object(forKey: "dataManager")
    }
    func encode(with aCoder: NSCoder) {
        //UserDefaults.standard.set(User, forKey: "User")
    }
    
    required init?(coder aDecoder: NSCoder) {
       //User = UserDefaults.standard.dictionary(forKey: "User")
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
