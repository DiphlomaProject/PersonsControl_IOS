//
//  ProjectTask.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/4/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import UIKit

class ProjectTask: NSObject ,NSCoding
{
    var id : Int?
    var title : String?
    var toProjectId : Int?
    var fromUserId : String?
    var desc : String?
    var dateTimeBegin : String?
    var dateTimeEnd : String?
    var isComplite : Bool?
    var projectName : String?
    var userFrom : String?

    init(json: NSMutableDictionary) { // Dictionary object
        self.id = (json["id"] as? Int)
        self.title = (json["title"] as? String)
        self.toProjectId = (json["toProjectId"] as? Int)
        self.fromUserId = (json["fromUserId"] as? String)
        self.dateTimeEnd = (json["dateTimeEnd"] as? String)
        self.desc = (json["desc"] as? String)
        self.dateTimeBegin = (json["dateTimeBegin"] as? String)
        self.isComplite = (json["isComplite"] as? Bool)
        self.dateTimeBegin = (json["dateTimeBegin"] as? String)
        self.projectName = (json["projectName"] as? String)
        
        
        
        
    }
    override init() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        self.id = (aDecoder.decodeObject(forKey: "id") as? Int)
        self.title = (aDecoder.decodeObject(forKey: "title") as? String)
        self.toProjectId = (aDecoder.decodeObject(forKey: "toProjectId") as? Int)
        self.fromUserId = (aDecoder.decodeObject(forKey: "fromUserId") as? String)
        self.dateTimeEnd = (aDecoder.decodeObject(forKey: "dateTimeEnd") as? String)
        self.desc = (aDecoder.decodeObject(forKey: "desc") as? String)
        self.dateTimeBegin = (aDecoder.decodeObject(forKey: "dateTimeBegin") as? String)
        self.isComplite = (aDecoder.decodeObject(forKey: "isComplite") as? Bool)
        self.projectName = (aDecoder.decodeObject(forKey: "projectName") as? String)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.toProjectId, forKey: "toProjectId")
        aCoder.encode(self.fromUserId, forKey: "fromUserId")
        aCoder.encode(self.desc, forKey: "desc")
        aCoder.encode(self.dateTimeBegin, forKey: "dateTimeBegin")
        aCoder.encode(self.isComplite, forKey: "isComplite")
        aCoder.encode(self.dateTimeEnd, forKey: "dateTimeEnd")
        aCoder.encode(self.projectName, forKey: "projectName")
    }
}

