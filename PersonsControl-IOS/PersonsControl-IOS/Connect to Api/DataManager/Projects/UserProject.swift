//
//  UserProject.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class UserProject: NSObject ,NSCoding
{
    
    var id : Int?
    var customer: Int?
    var title : String?
    var desc: String?
    var priceInDollars: Int?
    var isComplite: Bool?
    var beginTime: String?
    var untilTime: String?
    var ownerInfo : Owners?
    var customerInfo : Customer?
    var GroupInfo: [String] = []
    var myArray = ["Steve", "Bill", "Linus", "Bret"]
    init(json: NSMutableDictionary) { // Dictionary object
        self.id = (json["userId"] as? Int)
        self.customer = (json["customer"] as? Int)
        self.title = (json["title"] as? String)
        self.priceInDollars = (json["priceInDollars"] as? Int)
        self.desc = (json["desc"] as? String)
        self.isComplite = (json["isComplite"] as? Bool)
        self.beginTime = (json["beginTime"] as? String)
        self.untilTime = (json["untilTime"] as? String)

        
    }
    override init() {}
    
    required init?(coder aDecoder: NSCoder) {
        self.id = ((aDecoder.decodeObject(forKey: "userId") as? Int)!)
        self.customer = ((aDecoder.decodeObject(forKey: "customer") as? Int)!)
        self.title = ((aDecoder.decodeObject(forKey: "title") as? String)!)
        self.priceInDollars = ((aDecoder.decodeObject(forKey: "priceInDollars") as? Int)!)
        self.desc = ((aDecoder.decodeObject(forKey: "desc") as? String)!)
        self.isComplite = ((aDecoder.decodeObject(forKey: "isComplite") as? Bool)!)
        self.beginTime = ((aDecoder.decodeObject(forKey: "beginTime") as? String)!)
        self.untilTime = ((aDecoder.decodeObject(forKey: "untilTime") as? String)!)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "userId")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.customer, forKey: "customer")
        aCoder.encode(self.desc, forKey: "desc")
        aCoder.encode(self.priceInDollars, forKey: "priceInDollars")
        aCoder.encode(self.isComplite, forKey: "isComplite")
        aCoder.encode(self.beginTime, forKey: "beginTime")
        aCoder.encode(self.untilTime, forKey: "untilTime")
    }
}

