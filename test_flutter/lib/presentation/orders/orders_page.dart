import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/models/order_model.dart';
import 'package:test_flutter/domain/bloc/orders_cubit.dart';
import 'package:test_flutter/domain/bloc/orders_state.dart';
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
            if (state is OrdersLoadedState) {
              final orderList = state.orders;
              return Text('${orderList.length} commandes');
            }
            return Container();
          },
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {
          if (state is OrdersErrorState) {
            _showMessage(state.message);
          }
        },
        builder: (context, state) {
          if (state is OrdersErrorState) {
            return const Center(
              child: Text('Error occured!'),
            );
          }

          if (state is OrdersLoadedState) {
            final orders = state.orders;
            if (orders.isEmpty) {
              return const Center(
                child: Text('Orders list is empty !'),
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders.elementAt(index);
                  return OrderListTile(order: order);
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _showMessage(String message) {
    if (!mounted) return;
    showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (_, controller) {
          return Flash(
            controller: controller,
            backgroundColor: const Color(0xFFd50000),
            borderRadius: BorderRadius.circular(8.0),
            borderColor: Colors.transparent,
            position: FlashPosition.top,
            behavior: FlashBehavior.fixed,
            onTap: () => controller.dismiss(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
