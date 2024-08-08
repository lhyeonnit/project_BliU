import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F7F7), // 배경 색상
      padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  '공지사항',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
              Text(
                ' | ',
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '이용약관',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
              Text(
                ' | ',
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '개인정보처리방침',
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            '사업자 정보',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '회사명 : (주)비그라운드  |  대표 : 김예원\n'
                '사업자등록번호 12-345-6789\n'
                '제 통신판매업신고번호 : 제2024-서울강남-1234\n'
                '주소 : 서울특별시 OO구 OO동 OOO',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              height: 1.5,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Copyright © 2024 블리유. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
