//
//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 28.09.2018.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//
import Foundation
struct Groups : Codable {
	let id : Int?
	let title : String?
	let owner : String?
	let description : String?
//    let owner_info : Owners?

	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case title = "Title"
		case owner = "Owner"
		case description = "Description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		owner = try values.decodeIfPresent(String.self, forKey: .owner)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}
