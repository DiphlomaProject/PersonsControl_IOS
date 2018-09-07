import Foundation
struct Roles : Codable {
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
