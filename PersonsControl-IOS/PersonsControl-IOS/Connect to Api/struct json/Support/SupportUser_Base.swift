
import Foundation
struct SupportUser_Base : Codable {
	var code : Int?
	var message : String?
	var user : UserSupport?
	var time : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case user = "user"
		case time = "time"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		user = try values.decodeIfPresent(UserSupport.self, forKey: .user)
		time = try values.decodeIfPresent(String.self, forKey: .time)
	}

}
