//
//  Item.swift
//  AppDomain
//
//  Created by Ibrokhim Shukrullaev on 3/15/22.
//

import Foundation

// MARK: - Item
public struct Item: Codable {
	public let object: String
	public let id: Int
	public let name: String
	public let price: Int
	public let currency: String
	public let color: String

	enum CodingKeys: String, CodingKey {
		case object = "object"
		case id = "id"
		case name = "name"
		case price = "price"
		case currency = "currency"
		case color = "color"
	}

	public var asDictionary: [String : Any] {
		var dictionary: [String : Any] = [:]
		dictionary["object"] = object
		dictionary["id"] = id
		dictionary["name"] = name
		dictionary["price"] = price
		dictionary["currency"] = currency
		dictionary["color"] = color
		return dictionary
	}
}

