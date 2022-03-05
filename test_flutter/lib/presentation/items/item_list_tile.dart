import 'package:flutter/material.dart';
import '../../data/models/item_model.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    const size = 45.0;

    String safeColor = item.color!.replaceAll('#', '0xff');
    Color color = Color(int.parse(safeColor));

    return Container(
      height: size,
      child: Row(
        children: [
          Container(
            width: size,
            decoration: BoxDecoration(
              color: color,
            ),
            child: Center(
              child: Text(
                item.object ?? "",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            item.name ?? "",
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            '${item.price},00${item.currency}',
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
