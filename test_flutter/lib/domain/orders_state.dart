import 'package:equatable/equatable.dart';

import '../data/models/order_model.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
}

class OrdersInitialState extends OrdersState {
  @override
  List<Object> get props => [];
}

class OrdersLoadingState extends OrdersState {
  @override
  List<Object> get props => [];
}

class OrdersLoadedState extends OrdersState {
  OrdersLoadedState(this.orders);

  final List<OrderModel> orders;

  @override
  List<Object> get props => [orders];
}

class OrdersErrorState extends OrdersState {
  @override
  List<Object> get props => [];
}
