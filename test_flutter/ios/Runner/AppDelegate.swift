import UIKit
import Flutter
import AppDomain

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
	private let repository: OrdersRepository = DefaultOrdersRepository()

	override func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {

		guard let controller = window?.rootViewController as? FlutterViewController else {
			fatalError("rootViewController is not type FlutterViewController")
		}
		let mainChannel = FlutterMethodChannel(name: "main.channel",
											   binaryMessenger: controller.binaryMessenger)

		mainChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall,
														result: @escaping FlutterResult) -> Void in
			guard call.method == "getOrdersList" else {
				result(FlutterMethodNotImplemented)
				return
			}
			self?.getOrdersList(result: result)
		})

		GeneratedPluginRegistrant.register(with: self)
		return super.application(application, didFinishLaunchingWithOptions: launchOptions)
	}

	private func getOrdersList(result: @escaping FlutterResult) {
		repository.getOrdersList { receivedResult in
			switch receivedResult {
			case .success(let orders):
				result(orders.map({ $0.asDictionary }))
			case .failure(let error):
				result(FlutterError(code: "NetworkError",
									message: error.message,
									details: nil))
			}
		}
	}
}
