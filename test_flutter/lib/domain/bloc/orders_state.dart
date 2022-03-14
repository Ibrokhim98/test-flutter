import 'package:equatable/equatable.dart';
import 'package:test_flutter/data/models/order_model.dart';

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
  const OrdersLoadedState(this.orders);

  final List<OrderModel> orders;

  @override
  List<Object> get props => [orders];
}

class OrdersErrorState extends OrdersState {
  final String message;

  const OrdersErrorState(this.message);

  @override
  List<Object> get props => [message];
}
