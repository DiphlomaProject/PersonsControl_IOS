import Foundation
struct JsonData_Base : Codable {
	let code : Int?
	let message : String?
	let token : String?
	let data : Data?
	let time : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case message = "message"
		case token = "token"
		case data = "data"
		case time = "time"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
		time = try values.decodeIfPresent(String.self, forKey: .time)
	}

}
