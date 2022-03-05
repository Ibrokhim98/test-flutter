import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/domain/bloc/orders_cubit.dart';
import 'package:test_flutter/presentation/orders/orders_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider<OrdersCubit>(
          create: (_) => OrdersCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff7f8f9),
      ),
      home: const OrdersPage(),
    );
  }
}
