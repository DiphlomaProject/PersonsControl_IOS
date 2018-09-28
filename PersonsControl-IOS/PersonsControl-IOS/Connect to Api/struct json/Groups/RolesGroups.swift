//
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 28.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
struct RolesGroups : Codable {
	let userId : String?
	let roleId : String?

	enum CodingKeys: String, CodingKey {

		case userId = "UserId"
		case roleId = "RoleId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userId = try values.decodeIfPresent(String.self, forKey: .userId)
		roleId = try values.decodeIfPresent(String.self, forKey: .roleId)
	}

}
