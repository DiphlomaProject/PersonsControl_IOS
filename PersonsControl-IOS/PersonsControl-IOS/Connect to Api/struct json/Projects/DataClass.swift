//
//  DataClass.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
class DataClass: Codable {
    let customers: [[String: Customer]]
    let groups: [[String: [Group_Project]]]
    let projects: [Project]
    
    init(customers: [[String: Customer]], groups: [[String: [Group_Project]]], projects: [Project]) {
        self.customers = customers
        self.groups = groups
        self.projects = projects
    }
}
