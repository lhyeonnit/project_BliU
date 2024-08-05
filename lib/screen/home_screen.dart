import 'dart:io';
import 'package:bliu/widget/main_exhibition_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  DateTime? _backButtonPressedTime;

  int _selectedIndex = 0;
  List<Widget> contentWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    contentWidgets = [
      Stack(
        children: [
          Container(
            // TODO 이미지 자리
            color: Colors.red,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 660,
                  child: Stack(
                    children: [
                      SizedBox(
                        // TODO 상단영역
                        height: 56,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.green,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                color: Colors.amberAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  // child: AspectRatio(
                  //   aspectRatio: 3 / 1,
                  //   child: Container(
                  //     color: Colors.brown,
                  //   )
                  // ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
            alignment: Alignment.bottomRight,
            child: Container(
              color: Colors.brown,
              width: 40,
              height: 40,
              // TODO 버튼
            ),
          )
        ],
      ),
      Text('screen3'),
      Text('screen4'),
      Text('screen5'),
      Container(
        child: TextButton(
          onPressed: () {
            _pickImage();
          },
          child: Text('Pick Image Button'),
        ),
      ),
    ];

    var view = Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop){
          _backPressed();
        },
        child: SafeArea(
          child: contentWidgets.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            // 현재 아이콘이 선택된 아이콘일때와 선택된 아이콘이 아닌 경우 Icon을 다르게 하기 위함
              icon: _selectedIndex == 0? Icon(Icons.home_filled, color: Colors.black,): Icon(Icons.home_outlined, color: Colors.black),
              label: 'home'
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1? Icon(Icons.search, color: Colors.black,):  Icon(Icons.search_off, color: Colors.black,),
              label: 'search'
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2? Icon(Icons.shopping_bag, color: Colors.black,): Icon(Icons.shopping_bag_outlined, color: Colors.black),
              label: 'media'
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3? Icon(Icons.movie, color: Colors.black,): Icon(Icons.movie_outlined, color: Colors.black,),
              label: 'shop'
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 4? Icon(Icons.person, color: Colors.black): Icon(Icons.person_outline, color: Colors.black,),
              label: 'profile'
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showSelectedLabels: false, //(1)
        showUnselectedLabels: false, //(1)
        type: BottomNavigationBarType.fixed, //(2)
      ),
    );

    // var view = Scaffold(
    //   appBar: AppBar(
    //     title: Text('Grid View'),
    //   ),
    //   body: GridView.builder(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 3,
    //         mainAxisSpacing: 5,
    //         crossAxisSpacing: 5
    //     ),
    //     itemCount: 50,
    //     itemBuilder: (context, index) => testFunc(index),
    //   ),
    // );

    return view;
  }

  GestureDetector testFunc(int index) {
    var color = Colors.blue;
    if (index == 0) {
      color = Colors.red;
    } else if (index == 1) {
      color = Colors.green;
    }

    var view = GestureDetector(
      onTap: () {
        print("click index = $index");
      },
      child: Container(
        width: 100,
        height: 100,
        color: color,
      ),
    );

    // Container(
    //   width: 100,
    //   height: 100,
    //   //color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    // )
    return view;
  }

  // _handleTabSelection() {
  //   setState(() {
  //     _selectedIndex = tabController.index;
  //   });
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 카카오 로그인

  // 네이버 로그인

  // 이미지 선택
  Future<void> _pickImage() async {
    var imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _cropImage(image);
    }
  }

  //이미지 크롭
  Future<void> _cropImage(XFile image) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '이미지 자르기',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            hideBottomControls: true,
            lockAspectRatio: false),
        IOSUiSettings(
            title: '이미지 자르기',
            hidesNavigationBar: true,
            aspectRatioPickerButtonHidden: true,
            rotateClockwiseButtonHidden: true,
            rotateButtonsHidden: true
        ),
      ],
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