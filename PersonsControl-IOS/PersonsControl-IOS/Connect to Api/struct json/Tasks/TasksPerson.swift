//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
struct TasksPerson : Codable {
	let id : Int?
	let title : String?
	let toUserId : String?
	let fromUserId : String?
	let description : String?
	let dateTimeBegin : String?
	let dateTimeEnd : String?
	let isComplite : Bool?
	let userTo : UserTo?
	let userFrom : UserFrom?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case title = "title"
		case toUserId = "toUserId"
		case fromUserId = "fromUserId"
		case description = "description"
		case dateTimeBegin = "dateTimeBegin"
		case dateTimeEnd = "dateTimeEnd"
		case isComplite = "isComplite"
		case userTo = "userTo"
		case userFrom = "userFrom"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		toUserId = try values.decodeIfPresent(String.self, forKey: .toUserId)
		fromUserId = try values.decodeIfPresent(String.self, forKey: .fromUserId)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		dateTimeBegin = try values.decodeIfPresent(String.self, forKey: .dateTimeBegin)
		dateTimeEnd = try values.decodeIfPresent(String.self, forKey: .dateTimeEnd)
		isComplite = try values.decodeIfPresent(Bool.self, forKey: .isComplite)
		userTo = try values.decodeIfPresent(UserTo.self, forKey: .userTo)
		userFrom = try values.decodeIfPresent(UserFrom.self, forKey: .userFrom)
	}

}
