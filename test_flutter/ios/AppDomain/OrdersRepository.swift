//
//  OrdersRepository.swift
//  AppDomain
//
//  Created by Ibrokhim Shukrullaev on 3/15/22.
//

import Foundation

public protocol OrdersRepository {
	func getOrdersList(completion: @escaping (Result<[Order], Error>) -> Void)
}

public class DefaultOrdersRepository: OrdersRepository {
	
	public init() {}

	public func getOrdersList(completion: @escaping (Result<[Order], Error>) -> Void) {
		let orders: [Order] = [
			Order(
				object: "",
				id: 1,
				table: "2",
				guests: 3,
				date: "23",
				items: [
					Item(object: "", id: 1, name: "122", price: 21, currency: "32", color: "red")
				]
			),
			Order(
				object: "",
				id: 1,
				table: "2",
				guests: 3,
				date: "23",
				items: [
					Item(object: "", id: 1, name: "122", price: 21, currency: "32", color: "red")
				]
			),
			Order(
				object: "",
				id: 1,
				table: "2",
				guests: 3,
				date: "23",
				items: [
					Item(object: "", id: 1, name: "122", price: 21, currency: "32", color: "red")
				]
			),
		]
		
		completion(.success(orders))
	}
}
