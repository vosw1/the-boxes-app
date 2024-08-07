import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';
import 'components/custom_icon_text_button.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 3, // Display 3 items per row
        crossAxisSpacing: sm_gap, // Horizontal space between items
        mainAxisSpacing: sm_gap, // Vertical space between items
        children: [
          CustomIconTextButton(
            icon: Icons.move_to_inbox,
            text: '입출고',
            routeName: '/inout_page',
          ),
          CustomIconTextButton(
            icon: Icons.assignment,
            text: '입출고 지시',
            routeName: '/inout_instruction_page',
          ),
          CustomIconTextButton(
            icon: Icons.assignment,
            text: '품목',
            routeName: '/item_page',
          ),
          CustomIconTextButton(
            icon: Icons.location_on,
            text: '입출고처',
            routeName: '/inout_location_page',
          ),
          CustomIconTextButton(
            icon: Icons.inventory,
            text: '재고현황',
            routeName: '/inventory_status_page',
          ),
          CustomIconTextButton(
            icon: Icons.assessment,
            text: '입출고 현황',
            routeName: '/inout_status_page',
          ),
        ],
      ),
    );
  }
}
