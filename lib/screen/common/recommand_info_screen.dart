import 'package:flutter/material.dart';
import 'package:bliu/screen/common/component/date_bottom.dart'; // DateBottom import

import 'dummy/favorite_styles.dart';

class RecommandInfoScreen extends StatefulWidget {
  const RecommandInfoScreen({super.key});

  @override
  State<RecommandInfoScreen> createState() => _RecommandInfoScreenState();
}

class _RecommandInfoScreenState extends State<RecommandInfoScreen> {
  bool _isAppBarVisible = false;
  List<String> selectedStyles = [];
  String selectedDate = '선택해주세요';
  String selectedGender = '';

  void _showDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DateBottom(
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          initialDate: selectedDate,
        );
      },
    );
  }

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 배경 이미지
          Positioned.fill(
            child: Image.asset(
              'assets/images/recommend_info.png', // 이미지 파일 경로
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 100, // 텍스트를 하단에서 100픽셀 위에 배치
            left: 20,  // 좌측에서 20픽셀 띄움
            right: 20, // 우측에서 20픽셀 띄움
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8), // 회색 배경
                  borderRadius: BorderRadius.circular(20), // 둥근 모서리 설정
                ),
                child: Text(
                  '당신의 자녀는 어떤아이인가요?',
                  style: TextStyle(
                    color: Colors.white, // 텍스트 색상
                    fontSize: 18, // 텍스트 크기
                    fontWeight: FontWeight.bold, // 텍스트 두께
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // 위로 끌어올릴 수 있는 시트
          DraggableScrollableSheet(
            initialChildSize: 0.1, // 처음에 보여지는 크기 (0.0 ~ 1.0)
            minChildSize: 0.1, // 최소 크기
            maxChildSize: 1.0, // 최대 크기
            builder: (BuildContext context, ScrollController scrollController) {
              scrollController.addListener(() {
                if (scrollController.offset > 100 && !_isAppBarVisible) {
                  setState(() {
                    _isAppBarVisible = true;
                  });
                } else if (scrollController.offset <= 100 && _isAppBarVisible) {
                  setState(() {
                    _isAppBarVisible = false;
                  });
                }
              });

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 5,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '자녀의 정보를 입력해주세요',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '입력해주신 정보를 토대로 상품을 추천해드립니다.',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(height: 16),
                        // 출생년도 선택
                        Text(
                          '자녀의 출생년도',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            _showDateBottomSheet(context); // 출생년도 선택 모달 표시
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '출생년도',
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  selectedDate,
                                  style: TextStyle(fontSize: 14, color: Colors.pink),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        // 성별 선택
                        Text(
                          '자녀의 성별',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _selectGender('Boy');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.symmetric(horizontal: 4.0), // 박스 사이에 약간의 여백을 추가
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: selectedGender == 'Boy' ? Colors.pink : Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/gender_select_boy.png'),
                                        backgroundColor: Colors.white,
                                        radius: 40,
                                        foregroundColor: Colors.black,
                                        child: Opacity(
                                          opacity: selectedGender == 'Boy' ? 1.0 : 0.3,
                                          child: Image.asset(
                                            'assets/images/gender_select_boy.png',
                                            color: selectedGender == 'Boy' ? null : Colors.grey,
                                            colorBlendMode: selectedGender == 'Boy' ? BlendMode.dst : BlendMode.saturation,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Boy',
                                        style: TextStyle(
                                          color: selectedGender == 'Boy' ? Colors.pink : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _selectGender('Girl');
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.symmetric(horizontal: 4.0), // 박스 사이에 약간의 여백을 추가
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: selectedGender == 'Girl' ? Colors.pink : Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/gender_select_girl.png'),
                                        backgroundColor: Colors.white,
                                        radius: 40,
                                        child: Opacity(
                                          opacity: selectedGender == 'Girl' ? 1.0 : 0.3,
                                          child: Image.asset(
                                            'assets/images/gender_select_girl.png',
                                            color: selectedGender == 'Girl' ? null : Colors.grey,
                                            colorBlendMode: selectedGender == 'Girl' ? BlendMode.dst : BlendMode.saturation,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Girl',
                                        style: TextStyle(
                                          color: selectedGender == 'Girl' ? Colors.pink : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),
                        Text(
                          '선호 스타일',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: favoriteStyles.map((style) {
                            bool isSelected = selectedStyles.contains(style);
                            return ChoiceChip(
                              label: Text(style),
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.pink : Colors.black,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: isSelected ? Colors.pink : Colors.grey,
                                  width: 1,
                                ),
                              ),
                              backgroundColor: Colors.white,
                              selectedColor: Colors.white,
                              selected: isSelected,
                              avatar: null,
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    selectedStyles.add(style);
                                  } else {
                                    selectedStyles.remove(style);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // 확인 버튼 동작
                          },
                          child: Text('확인'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48),
                            backgroundColor: Colors.grey, // 버튼 배경색
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          // 애니메이션으로 표시될 앱바
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Visibility(
              visible: _isAppBarVisible,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: _isAppBarVisible ? 1.0 : 0.0,
                child: AppBar(
                  title: Text('추천정보'),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
