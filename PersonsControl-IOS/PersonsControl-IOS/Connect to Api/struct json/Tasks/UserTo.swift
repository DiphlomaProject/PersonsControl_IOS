//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
struct UserTo : Codable {
	let roleNames : String?
	let img : String?
	let claims : [String]?
	let logins : [String]?
	let roles : [Roles]?
	let address : String?
	let country : String?
	let city : String?
	let displayName : String?
	let fCMToken : String?
	let email : String?
	let emailConfirmed : Bool?
	let passwordHash : String?
	let securityStamp : String?
	let phoneNumber : String?
	let phoneNumberConfirmed : Bool?
	let twoFactorEnabled : Bool?
	let lockoutEndDateUtc : String?
	let lockoutEnabled : Bool?
	let accessFailedCount : Int?
	let id : String?
	let userName : String?

	enum CodingKeys: String, CodingKey {

		case roleNames = "RoleNames"
		case img = "img"
		case claims = "Claims"
		case logins = "Logins"
		case roles = "Roles"
		case address = "Address"
		case country = "Country"
		case city = "City"
		case displayName = "DisplayName"
		case fCMToken = "FCMToken"
		case email = "Email"
		case emailConfirmed = "EmailConfirmed"
		case passwordHash = "PasswordHash"
		case securityStamp = "SecurityStamp"
		case phoneNumber = "PhoneNumber"
		case phoneNumberConfirmed = "PhoneNumberConfirmed"
		case twoFactorEnabled = "TwoFactorEnabled"
		case lockoutEndDateUtc = "LockoutEndDateUtc"
		case lockoutEnabled = "LockoutEnabled"
		case accessFailedCount = "AccessFailedCount"
		case id = "Id"
		case userName = "UserName"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        roleNames = try values.decodeIfPresent(String.self, forKey: .roleNames)
		img = try values.decodeIfPresent(String.self, forKey: .img)
        claims = try values.decodeIfPresent([String].self, forKey: .claims)
        logins = try values.decodeIfPresent([String].self, forKey: .logins)
        roles = try values.decodeIfPresent([Roles].self, forKey: .roles)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        fCMToken = try values.decodeIfPresent(String.self, forKey: .fCMToken)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        emailConfirmed = try values.decodeIfPresent(Bool.self, forKey: .emailConfirmed)
        passwordHash = try values.decodeIfPresent(String.self, forKey: .passwordHash)
        securityStamp = try values.decodeIfPresent(String.self, forKey: .securityStamp)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        phoneNumberConfirmed = try values.decodeIfPresent(Bool.self, forKey: .phoneNumberConfirmed)
        twoFactorEnabled = try values.decodeIfPresent(Bool.self, forKey: .twoFactorEnabled)
        lockoutEndDateUtc = try values.decodeIfPresent(String.self, forKey: .lockoutEndDateUtc)
        lockoutEnabled = try values.decodeIfPresent(Bool.self, forKey: .lockoutEnabled)
        accessFailedCount = try values.decodeIfPresent(Int.self, forKey: .accessFailedCount)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        userName = try values.decodeIfPresent(String.self, forKey: .userName)
	}

}
