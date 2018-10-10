

import Foundation
struct SupportTask_Base : Codable {
	let code : Int?
	let message : String?
	let taskcomplete : TaskComplete?
	let time : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case taskcomplete = "user"
		case time = "time"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		taskcomplete = try values.decodeIfPresent(TaskComplete.self, forKey: .taskcomplete)
		time = try values.decodeIfPresent(String.self, forKey: .time)
	}

}
