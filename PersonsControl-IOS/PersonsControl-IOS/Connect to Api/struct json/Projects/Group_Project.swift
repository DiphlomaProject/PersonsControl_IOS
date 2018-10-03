//
//  Group_Project.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class Group_Project: Codable {
    let id: Int
    let title, owner, description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title = "Title"
        case owner = "Owner"
        case description = "Description"
    }
    
    init(id: Int, title: String, owner: String, description: String) {
        self.id = id
        self.title = title
        self.owner = owner
        self.description = description
    }
}
