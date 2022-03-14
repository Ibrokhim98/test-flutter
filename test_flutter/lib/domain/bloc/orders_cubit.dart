import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/repository/orders_repository.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitialState());

  final OrdersRepository _repository = OrdersRepository();

  void getOrders() async {
    try {
      emit(OrdersLoadingState());
      final result = await _repository.fetchOrders();
      result.fold(
        (error) => emit(OrdersErrorState(error.toString())),
        (movies) => emit(OrdersLoadedState(movies)),
      );
    } catch (e) {
      emit(OrdersErrorState(e.toString()));
    }
  }
}
