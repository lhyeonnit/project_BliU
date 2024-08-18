import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/component/date_bottom.dart';
import '../../common/dummy/favorite_styles.dart';

class RecommendEdit extends StatefulWidget {
  const RecommendEdit({super.key});

  @override
  State<RecommendEdit> createState() => _RecommendEditState();
}

class _RecommendEditState extends State<RecommendEdit> {

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/login/ic_back.svg"),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 동작
          },
        ),
        title: Text(
          '추천정보',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          // 박스 사이에 약간의 여백을 추가
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedGender == 'Boy'
                                  ? Colors.pink
                                  : Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/gender_select_boy.png'),
                                backgroundColor: Colors.white,
                                radius: 40,
                                foregroundColor: Colors.black,
                                child: Opacity(
                                  opacity: selectedGender == 'Boy' ? 1.0 : 0.3,
                                  child: Image.asset(
                                    'assets/images/gender_select_boy.png',
                                    color: selectedGender == 'Boy'
                                        ? null
                                        : Colors.grey,
                                    colorBlendMode: selectedGender == 'Boy'
                                        ? BlendMode.dst
                                        : BlendMode.saturation,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Boy',
                                style: TextStyle(
                                  color: selectedGender == 'Boy'
                                      ? Colors.pink
                                      : Colors.black,
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
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          // 박스 사이에 약간의 여백을 추가
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedGender == 'Girl'
                                  ? Colors.pink
                                  : Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/gender_select_girl.png'),
                                backgroundColor: Colors.white,
                                radius: 40,
                                child: Opacity(
                                  opacity: selectedGender == 'Girl' ? 1.0 : 0.3,
                                  child: Image.asset(
                                    'assets/images/gender_select_girl.png',
                                    color: selectedGender == 'Girl'
                                        ? null
                                        : Colors.grey,
                                    colorBlendMode: selectedGender == 'Girl'
                                        ? BlendMode.dst
                                        : BlendMode.saturation,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Girl',
                                style: TextStyle(
                                  color: selectedGender == 'Girl'
                                      ? Colors.pink
                                      : Colors.black,
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
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
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
  }
}
