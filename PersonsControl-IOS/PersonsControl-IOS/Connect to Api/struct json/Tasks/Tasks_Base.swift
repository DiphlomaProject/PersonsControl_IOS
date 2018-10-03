//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
struct Tasks_Base : Codable {
	let code : Int?
	let data : DataTasks?
	let time : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case data = "data"
		case time = "time"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		data = try values.decodeIfPresent(DataTasks.self, forKey: .data)
		time = try values.decodeIfPresent(String.self, forKey: .time)
	}

}
