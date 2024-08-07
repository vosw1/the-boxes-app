import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

class InventoryStatusBody extends StatelessWidget {
  const InventoryStatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top section: Date fields, search bar, and additional filters
        Container(
          color: Colors.grey[200],
          // Background color for date fields and search bar
          child: Padding(
            padding: const EdgeInsets.all(sm_gap),
            // Padding inside the container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date fields
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Start Date',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: sm_gap),
                        ),
                      ),
                    ),
                    SizedBox(width: sm_gap), // Space between the date fields
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'End Date',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: sm_gap),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sm_gap),
                // Space between the date fields and the search bar

                // Search bar and button
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: sm_gap),
                        ),
                      ),
                    ),
                    SizedBox(width: sm_gap),
                    // Space between search bar and button
                    ElevatedButton(
                      onPressed: () {
                        // Define search action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent, // Text color
                      ),
                      child: Text('검색'),
                    ),
                  ],
                ),
                SizedBox(height: sm_gap),
                // Space between the search bar and additional filters

                // Additional filters with checkboxes
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: false, // Checkbox initial value
                            onChanged: (bool? value) {
                              // Define checkbox change action
                            },
                          ),
                          Text('입출고 발생 품목만'),
                        ],
                      ),
                    ),
                    SizedBox(width: sm_gap), // Space between the checkboxes
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: false, // Checkbox initial value
                            onChanged: (bool? value) {
                              // Define checkbox change action
                            },
                          ),
                          Text('재고있는 품목만'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: sm_gap),
        // Space between the top section and the result section

        // Bottom section: Empty space with white background
        Expanded(
          child: Container(
            color: Colors.white, // Background color for the results section
          ),
        ),
      ],
    );
  }
}
