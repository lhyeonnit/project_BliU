import 'dart:io';
import 'package:bliu/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  DateTime? _backButtonPressedTime;
  // final Image _splashImage = Image.asset(
  //   'assets/splash/splash.png',
  //   fit: BoxFit.fitHeight,
  // );
  // bool _visible = true;
  // double _fade = 1;

  final communityPageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop){
          //print("didPop ---> ${didPop}");
          if (!didPop) {
            _backPressed();
          }
        },
        child: Stack(children: <Widget>[
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 66,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: communityPageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      // TODO 뷰 만들기
                      var color = Colors.red;
                      if (index == 1) {
                        color = Colors.brown;
                      }
                      return Container(
                        color: color,
                      );
                    }
                  )
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: SmoothPageIndicator(
                            controller: communityPageController,
                            count: 4,
                            effect: const ScrollingDotsEffect(
                              activeDotColor: Colors.indigoAccent,
                              activeStrokeWidth: 10,
                              activeDotScale: 1.5,
                              maxVisibleDots: 5,
                              radius: 8,
                              spacing: 10,
                              dotHeight: 4,
                              dotWidth: 4,
                            )
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        height: 58,
                        margin: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          width: 88,
                          height: 38,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Get.to(() => const HomeScreen());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xffDDDDDD),
                                ),
                              ),
                              child: const Text(
                                "건너뛰기",
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // AnimatedOpacity(
          //   duration: const Duration(milliseconds: 500),
          //   curve: Curves.fastOutSlowIn,
          //   opacity: _fade,
          //   onEnd: () {
          //     if (_visible) {
          //       //_splashGone();
          //     }
          //   },
          //   child: Visibility(
          //     visible: _visible,
          //     child: SizedBox(
          //       width: double.infinity,
          //       height: double.infinity,
          //       child: _splashImage,
          //     ),
          //   ),
          // )
        ]),
      ),
    );
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
}
