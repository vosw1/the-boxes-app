import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use your custom AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3, // 한 줄에 3개 아이템 표시
          crossAxisSpacing: 16.0, // 아이템 간의 가로 간격
          mainAxisSpacing: 16.0, // 아이템 간의 세로 간격
          children: [
            CustomIconTextButton(
              icon: Icons.home,
              text: 'Home',
              routeName: '/home', // 이동할 페이지의 라우트 이름
            ),
            CustomIconTextButton(
              icon: Icons.settings,
              text: 'Settings',
              routeName: '/settings', // 이동할 페이지의 라우트 이름
            ),
            CustomIconTextButton(
              icon: Icons.info,
              text: 'Info',
              routeName: '/info', // 이동할 페이지의 라우트 이름
            ),
            // 더 많은 버튼을 추가할 수 있습니다.
          ],
        ),
      ),
    );
  }
}