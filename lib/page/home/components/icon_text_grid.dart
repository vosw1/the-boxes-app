import 'package:flutter/material.dart';
import 'icon_text_item.dart'; // Import the IconTextItem class

class IconTextGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const IconTextGrid({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 items per row
        crossAxisSpacing: 16.0, // Space between items horizontally
        mainAxisSpacing: 16.0, // Space between items vertically
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return IconTextItem(
          icon: item['icon'],
          text: item['text'],
        );
      },
    );
  }
}
