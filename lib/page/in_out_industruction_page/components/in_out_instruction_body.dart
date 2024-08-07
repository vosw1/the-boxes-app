import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

class InOutInstructionBody extends StatelessWidget {
  const InOutInstructionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top section: Date fields and search bar
        Container(
          color: Colors.grey[200], // Background color for date fields and search bar
          child: Padding(
            padding: const EdgeInsets.all(sm_gap), // Padding for the date fields and search bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Start Date',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal:sm_gap),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0), // Space between the date fields
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'End Date',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: sm_gap),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0), // Space between the date fields and the search bar

                // Search bar and button
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: sm_gap),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0), // Space between search bar and button
                    ElevatedButton(
                      onPressed: () {
                        // Define search action
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Text color
                      ),
                      child: Text('검색'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: sm_gap), // Space between the date/search section and the result section

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
