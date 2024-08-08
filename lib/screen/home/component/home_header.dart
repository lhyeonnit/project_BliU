import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;
  final int _totalPages = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (_currentPage < _totalPages - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            buildPage(
              imagePath: 'assets/images/home/main_bn01.png',
              title: '아이들을 위한',
              subtitle: '스타일리시한 선택!',
              description: '특별한 시간을 오래오래 함께하고 하고싶은',
            ),
            buildPage(
              imagePath: 'assets/images/home/main_bn02.png',
              title: '새로운 스타일',
              subtitle: '모두가 주목하는!',
              description: '아이들의 특별한 순간을 위해',
            ),
          ],
        ),
        Positioned(
          bottom: 115.0,
          left: 0,
          right: 327,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _totalPages,
              effect: WormEffect(
                dotWidth: 6.0,
                dotHeight: 6.0,
                activeDotColor: Colors.white,
                dotColor: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage({
    required String imagePath,
    required String title,
    required String subtitle,
    required String description,
  }) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 625.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // 이미지를 전체 화면에 맞추고 가로 여백 없이 설정
          ),
        ),
        Positioned(
          bottom: 140.8,
          left: 16.0,
          right: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
