import 'dart:convert';
import 'package:test_flutter/data/models/order_model.dart';
import 'package:test_flutter/data/orders_response.dart';
import 'package:http/http.dart' as http;

class OrdersRepository {
  Future<List<OrderModel>> fetchOrders() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/popina/test-flutter/main/data.json'));

    final parsedResponse = OrdersResponse.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return parsedResponse.orders ?? [];
    } else {
      throw Exception('Failed to load album');
    }
  }
}
