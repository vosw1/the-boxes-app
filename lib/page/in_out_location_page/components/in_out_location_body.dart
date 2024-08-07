import 'package:flutter/material.dart';
import 'package:the_boxes/_core/constants/size.dart';

class InOutLocationBody extends StatelessWidget {
  const InOutLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top section: 입출고처 and 품목분류 with search button
        Container(
          color: Colors.grey[200], // Background color for the top section
          child: Padding(
            padding: EdgeInsets.all(sm_gap), // Padding inside the container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First row: 입출고처
                TextField(
                  decoration: InputDecoration(
                    labelText: '입출고처',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: sm_gap),
                  ),
                ),
                SizedBox(height: sm_gap), // Space between the input field and search section

                // Second row: 품목분류 with search button
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '품목분류',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: sm_gap),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0), // Space between 품목분류 and the search button
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
                SizedBox(height: s_gap), // Space between the search button and 사용품목만 checkbox

                // Third row: 사용품목만 checkbox
                Row(
                  children: [
                    Checkbox(
                      value: false, // Checkbox initial value
                      onChanged: (bool? value) {
                        // Define checkbox change action
                      },
                    ),
                    Text('사용 입출고처만'),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: ss_gap), // Space between the top section and the result section

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
