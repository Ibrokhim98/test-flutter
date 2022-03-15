import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/data/models/order_model.dart';
import 'package:test_flutter/domain/networking/network_error.dart';

class OrdersRepository {
  Future<Either<Exception, List<OrderModel>>> fetchOrders() async {
    // final apiService = ApiService.create();
    // final response = await apiService.getOrders();
    //
    // final parsedResponse = OrdersResponse.fromJson(response.body);

    // if (response.base.statusCode == 200) {
    //   return Right(parsedResponse.orders ?? []);
    // } else {
    //   return Left(NetworkError('Failed to load data'));
    // }

    const platform = MethodChannel('main.channel');
    try {
      final List<dynamic>? result =
          await platform.invokeMethod('getOrdersList');
      List<OrderModel> orders = [];

      if (result != null) {
        for (var element in result) {
          var value = (element as Map).cast<String, dynamic>();
          final order = OrderModel.fromMap(value);
          orders.add(order);
        }
        return Right(orders);
      } else {
        return Left(NetworkError('Failed to load data'));
      }
    } on PlatformException catch (e) {
      return Left(NetworkError(e.message));
    }
  }
}
