import 'models/order_model.dart';

class OrdersRepository {
  Future<dynamic> fetchOrders() async {
    List<OrderModel> orders = [
      OrderModel(
          object: "dfdfd", guests: 3, table: '2', date: '', id: 2, items: []),
      OrderModel(
          object: "dfdfd", guests: 3, table: '2', date: '', id: 2, items: []),
      OrderModel(
          object: "sd", guests: 2, table: '6', date: '', id: 1, items: [])
    ];
    return orders;
  }
}
