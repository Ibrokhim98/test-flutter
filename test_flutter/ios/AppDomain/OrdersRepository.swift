//
//  OrdersRepository.swift
//  AppDomain
//
//  Created by Ibrokhim Shukrullaev on 3/15/22.
//

import Foundation

public protocol OrdersRepository {
	func getOrdersList(completion: @escaping (Result<[Order], NetworkError>) -> Void)
}

public class DefaultOrdersRepository: OrdersRepository {
	private let apiService: RemoteAPIService
	private let url = "https://raw.githubusercontent.com/popina/test-flutter/main/data.json"

	public init() {
		self.apiService = DefaultRemoteAPIService()
	}

	public func getOrdersList(completion: @escaping (Result<[Order], NetworkError>) -> Void) {
		apiService.fetchOrders(from: url) { result in
			switch result {
			case .success(let ordersResponse):
				print(ordersResponse.orders)
				completion(.success(ordersResponse.orders))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
