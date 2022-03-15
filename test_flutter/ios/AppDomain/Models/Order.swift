//
//  Order.swift
//  AppDomain
//
//  Created by Ibrokhim Shukrullaev on 3/15/22.
//

import Foundation

// MARK: - Order
public struct Order: Codable {
	public let object: String
	public let id: Int
	public let table: String
	public let guests: Int
	public let date: String
	public let items: [Item]

	enum CodingKeys: String, CodingKey {
		case object = "object"
		case id = "id"
		case table = "table"
		case guests = "guests"
		case date = "date"
		case items = "items"
	}

	public var asDictionary: [String : Any] {
		var dictionary: [String : Any] = [:]
		dictionary["object"] = object
		dictionary["id"] = id
		dictionary["table"] = table
		dictionary["guests"] = guests
		dictionary["date"] = date
		dictionary["items"] = items.map({ $0.asDictionary })
		return dictionary
	}
}
