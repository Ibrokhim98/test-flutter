import 'package:flutter/material.dart';
import '../../config/asset_colors.dart';
import '../../data/models/order_model.dart';
import 'item_list_tile.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AssetColors.boldColor,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          color: AssetColors.boldColor,
          fontSize: 20,
        ),
        title: Text('Table ${order.table}'),
        centerTitle: true,
        bottom: PreferredSize(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${order.items?.length} produits',
                      style: const TextStyle(
                        fontSize: 18,
                        color: AssetColors.lightColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const VerticalDivider(
                      color: AssetColors.lightColor,
                      thickness: 2,
                      // endIndent: 18,
                      // indent: 6,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: order.totalPrice.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: AssetColors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ',00 ${order.currency}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: AssetColors.blue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 2) - 2,
                  color: AssetColors.blue,
                  height: 5,
                ),
              )
            ],
          ),
          preferredSize: const Size.fromHeight(52.0),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: order.items?.length ?? 0,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = order.items?.elementAt(index);

          if (item != null) {
            return ItemListTile(item: item);
          }
          return Container();
        },
      ),
    );
  }
}
