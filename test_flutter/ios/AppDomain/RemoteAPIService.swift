//
//  RemoteAPIService.swift
//  AppDomain
//
//  Created by Ibrokhim Shukrullaev on 3/16/22.
//

import Foundation

//MARK: - RemoteAPIService
protocol RemoteAPIService {
	func fetchOrders(from urlString: String, completion: @escaping (Result<OrdersResponse, NetworkError>) -> Void)
}


//MARK: - DefaultRemoteAPIService
final class DefaultRemoteAPIService: RemoteAPIService {

	func fetchOrders(from urlString: String, completion: @escaping (Result<OrdersResponse, NetworkError>) -> Void) {
		if let url = URL(string: urlString) {
			let session = URLSession(configuration: .default)

			let task = session.dataTask(with: url) { [weak self] (data, response, error) in
				if let error = error {
					completion(.failure(NetworkError(message: error.localizedDescription)))
					return
				}

				guard let safeData = data, let ordersData = self?.parseJSON(safeData) else {
					completion(.failure(NetworkError(message: "Invalid data")))
					return
				}

				completion(.success(ordersData))
			}
			task.resume()
		}
	}

	private func parseJSON(_ responseData: Data) -> OrdersResponse? {
		let decoder = JSONDecoder()
		do {
			let response = try decoder.decode(OrdersResponse.self, from: responseData)
			return response
		} catch {
			return nil
		}
	}
}

