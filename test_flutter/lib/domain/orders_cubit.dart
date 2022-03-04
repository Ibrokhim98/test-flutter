import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/orders_repository.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitialState());

  final OrdersRepository _repository = OrdersRepository();

  void getOrders() async {
    try {
      emit(OrdersLoadingState());
      final movies = await _repository.fetchOrders();
      emit(OrdersLoadedState(movies));
    } catch (e) {
      emit(OrdersErrorState());
    }
  }
}
