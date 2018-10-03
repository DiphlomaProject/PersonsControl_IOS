//
//  Project.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class Project: Codable {
    let id, customer: Int
    let title, description: String
    let priceInDollars: Int
    let isComplite: Bool
    let beginTime, untilTime: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case customer = "Customer"
        case title = "Title"
        case description = "Description"
        case priceInDollars = "PriceInDollars"
        case isComplite
        case beginTime = "BeginTime"
        case untilTime = "UntilTime"
    }
    
    init(id: Int, customer: Int, title: String, description: String, priceInDollars: Int, isComplite: Bool, beginTime: String, untilTime: String) {
        self.id = id
        self.customer = customer
        self.title = title
        self.description = description
        self.priceInDollars = priceInDollars
        self.isComplite = isComplite
        self.beginTime = beginTime
        self.untilTime = untilTime
    }
}
