import 'package:test_flutter/data/models/order_model.dart';
import 'package:test_flutter/data/orders_response.dart';
import 'package:test_flutter/domain/networking/api_service.dart';

class OrdersRepository {
  Future<List<OrderModel>> fetchOrders() async {
    final apiService = ApiService.create();
    final response = await apiService.getOrders();

    final parsedResponse = OrdersResponse.fromJson(response.body);

    if (response.base.statusCode == 200) {
      return parsedResponse.orders ?? [];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
