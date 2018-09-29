//
//  UserGroups.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 9/28/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class Group: NSObject,NSCoding
{

    var id : Int?
    var title : String?
    var owner : String?
    var desc: String?
    var ownerInfo : Owners?
    
    init(json: NSMutableDictionary) { // Dictionary object
        self.id = (json["id"] as? Int)
        self.title = (json["title"] as? String)
        self.owner = (json["owner"] as? String)
        self.desc = (json["desc"] as? String)
       
    }
    override init() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        self.id = (aDecoder.decodeObject(forKey: "id") as? Int)
        self.title = (aDecoder.decodeObject(forKey: "title") as? String)
        self.owner = (aDecoder.decodeObject(forKey: "owner") as? String)
        self.desc = (aDecoder.decodeObject(forKey: "desc") as? String)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.owner, forKey: "owner")
        aCoder.encode(self.desc, forKey: "desc")
    }
}
