import 'dart:io';

import 'package:bliu/screen/category/category_page.dart';
import 'package:bliu/screen/home/home_page.dart';
import 'package:bliu/screen/like/like_page.dart';
import 'package:bliu/screen/mypage/my_page.dart';
import 'package:bliu/screen/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '_component/custom_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime? _backButtonPressedTime;
  int _selectedIndex = 2;

  final List<Widget> _widgetOptions = <Widget>[
    StorePage(),
    LikePage(),
    HomePage(),
    CategoryPage(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _backPressed() async {
    if (Platform.isAndroid) { // 안드로이드 경우일때만
      DateTime currentTime = DateTime.now();

      //Statement 1 Or statement2
      bool backButton = _backButtonPressedTime == null ||
          currentTime.difference(_backButtonPressedTime!) > const Duration(seconds: 3);

      if (backButton) {
        _backButtonPressedTime = currentTime;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("한번 더 뒤로가기를 누를 시 종료됩니다"),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      );
  }
}
