import 'package:dartz/dartz.dart';
import 'package:test_flutter/data/models/order_model.dart';
import 'package:test_flutter/data/orders_response.dart';
import 'package:test_flutter/domain/networking/api_service.dart';
import 'package:test_flutter/domain/networking/network_error.dart';

class OrdersRepository {
  Future<Either<Exception, List<OrderModel>>> fetchOrders() async {
    final apiService = ApiService.create();
    final response = await apiService.getOrders();

    final parsedResponse = OrdersResponse.fromJson(response.body);

    if (response.base.statusCode == 300) {
      return Right(parsedResponse.orders ?? []);
    } else {
      return Left(NetworkError('Failed to load data'));
    }
  }
}
