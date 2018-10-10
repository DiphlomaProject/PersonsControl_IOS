
import Foundation
struct TaskComplete : Codable {
	let id : Int?
	let title : String?
	let toProjectId : Int?
	let fromUserId : String?
	let description : String?
	let dateTimeBegin : String?
	let dateTimeEnd : String?
	let isComplite : Bool?
	let projectName : String?
	let userFrom : String?
    let toUserId : String?
    let toGroupId : Int?
	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case title = "title"
		case toProjectId = "toProjectId"
		case fromUserId = "fromUserId"
		case description = "description"
		case dateTimeBegin = "dateTimeBegin"
		case dateTimeEnd = "dateTimeEnd"
		case isComplite = "isComplite"
		case projectName = "projectName"
		case userFrom = "userFrom"
        case toUserId = "toUserId"
        case toGroupId = "toGroupId"
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		toProjectId = try values.decodeIfPresent(Int.self, forKey: .toProjectId)
		fromUserId = try values.decodeIfPresent(String.self, forKey: .fromUserId)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		dateTimeBegin = try values.decodeIfPresent(String.self, forKey: .dateTimeBegin)
		dateTimeEnd = try values.decodeIfPresent(String.self, forKey: .dateTimeEnd)
		isComplite = try values.decodeIfPresent(Bool.self, forKey: .isComplite)
		projectName = try values.decodeIfPresent(String.self, forKey: .projectName)
		userFrom = try values.decodeIfPresent(String.self, forKey: .userFrom)
        toUserId = try values.decodeIfPresent(String.self, forKey: .toUserId)
        toGroupId = try values.decodeIfPresent(Int.self, forKey: .toGroupId)
	}

}
