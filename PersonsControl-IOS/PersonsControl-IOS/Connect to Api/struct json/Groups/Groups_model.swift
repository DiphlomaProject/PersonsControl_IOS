//
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 28.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
struct Groups_model : Codable {
	let owners : [Owners]?
	let groups : [Groups]?

	enum CodingKeys: String, CodingKey {

		case owners = "owners"
		case groups = "groups"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		owners = try values.decodeIfPresent([Owners].self, forKey: .owners)
		groups = try values.decodeIfPresent([Groups].self, forKey: .groups)
	}

}
