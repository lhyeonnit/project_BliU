import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final PageController _pageController = PageController();
  int _activeIndex = 0;

  final List<String> _images = [
    'assets/images/home/main_bn01.png',
    'assets/images/home/main_bn02.png',
    'assets/images/home/main_bn03.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _activeIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('bliU'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return imageSlider(_images[index], index);
              },
            ),
          ),
          indicator(),
        ],
      ),
    );
  }

  Widget imageSlider(String path, int index) {
    return Container(
      width: double.infinity,
      height: 240,
      color: Colors.grey,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  Widget indicator() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.bottomCenter,
      child: AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        count: _images.length,
        effect: JumpingDotEffect(
          dotHeight: 6,
          dotWidth: 6,
          activeDotColor: Colors.white,
          dotColor: Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }
}
