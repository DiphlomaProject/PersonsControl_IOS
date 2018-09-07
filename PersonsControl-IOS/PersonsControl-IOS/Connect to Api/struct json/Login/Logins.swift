import Foundation
struct Logins : Codable {
	let loginProvider : String?
	let providerKey : String?
	let userId : String?

	enum CodingKeys: String, CodingKey {

		case loginProvider = "LoginProvider"
		case providerKey = "ProviderKey"
		case userId = "UserId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		loginProvider = try values.decodeIfPresent(String.self, forKey: .loginProvider)
		providerKey = try values.decodeIfPresent(String.self, forKey: .providerKey)
		userId = try values.decodeIfPresent(String.self, forKey: .userId)
	}

}
