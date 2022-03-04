import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/orders_cubit.dart';
import 'package:test_flutter/domain/orders_state.dart';
import '../data/models/order_model.dart';
import 'order_list_tile.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.blue,
          fontSize: 20,
        ),
        title: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            List<OrderModel> orderList = [];
            if (state is OrdersLoadedState) {
              orderList = state.orders;
            }
            return Text('${orderList.length} commandes');
          },
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoadedState) {
            final orders = state.orders;
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders.elementAt(index);
                return OrderListTile(
                  order: order,
                );
              },
            );
          }
          return const Center(child: Text('Orders list is empty !'));
        },
      ),
    );
  }
}
