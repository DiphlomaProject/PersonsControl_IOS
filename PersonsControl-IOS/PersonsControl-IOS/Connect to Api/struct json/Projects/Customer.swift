//
//  Customer.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class Customer: Codable {
    let id: Int
    let company, contactPerson, position, phone: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case company = "Company"
        case contactPerson = "ContactPerson"
        case position = "Position"
        case phone = "Phone"
        case description = "Description"
    }
    
    init(id: Int, company: String, contactPerson: String, position: String, phone: String, description: String) {
        self.id = id
        self.company = company
        self.contactPerson = contactPerson
        self.position = position
        self.phone = phone
        self.description = description
    }
}
