//
//  OrdersResponse.swift
//  AppDomain
//
//  Created by Ibrokhim Shukrullaev on 3/15/22.
//

import Foundation

// MARK: - OrdersResponse
struct OrdersResponse: Codable {
	let object: String
	let orders: [Order]

	enum CodingKeys: String, CodingKey {
		case object = "object"
		case orders = "orders"
	}
}
