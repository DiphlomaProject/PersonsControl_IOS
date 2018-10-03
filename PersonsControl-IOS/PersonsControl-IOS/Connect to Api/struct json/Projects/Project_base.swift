//
//  JSONData_Project.swift
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//
import Foundation
class Project_base: Codable {
    let code: Int
    let data: DataClass
    let time: String
    
    init(code: Int, data: DataClass, time: String) {
        self.code = code
        self.data = data
        self.time = time
    }
}
