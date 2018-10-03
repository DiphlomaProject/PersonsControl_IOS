//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
struct TasksGroups : Codable {
	let id : Int?
	let title : String?
	let toGroupId : Int?
	let fromUserId : String?
	let description : String?
	let dateTimeBegin : String?
	let dateTimeEnd : String?
	let isComplite : Bool?
	let groupName : String?
	let userFrom : UserFrom?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case title = "title"
		case toGroupId = "toGroupId"
		case fromUserId = "fromUserId"
		case description = "description"
		case dateTimeBegin = "dateTimeBegin"
		case dateTimeEnd = "dateTimeEnd"
		case isComplite = "isComplite"
		case groupName = "groupName"
		case userFrom = "userFrom"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		toGroupId = try values.decodeIfPresent(Int.self, forKey: .toGroupId)
		fromUserId = try values.decodeIfPresent(String.self, forKey: .fromUserId)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		dateTimeBegin = try values.decodeIfPresent(String.self, forKey: .dateTimeBegin)
		dateTimeEnd = try values.decodeIfPresent(String.self, forKey: .dateTimeEnd)
		isComplite = try values.decodeIfPresent(Bool.self, forKey: .isComplite)
		groupName = try values.decodeIfPresent(String.self, forKey: .groupName)
		userFrom = try values.decodeIfPresent(UserFrom.self, forKey: .userFrom)
	}

}
