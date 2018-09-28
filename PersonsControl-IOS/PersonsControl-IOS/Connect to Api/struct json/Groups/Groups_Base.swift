//
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 28.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//
import Foundation
struct Groups_Base : Codable {
	let code : Int?
	let groups_model : Groups_model?
	let time : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case groups_model = "groups_model"
		case time = "time"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		groups_model = try values.decodeIfPresent(Groups_model.self, forKey: .groups_model)
		time = try values.decodeIfPresent(String.self, forKey: .time)
	}

}
