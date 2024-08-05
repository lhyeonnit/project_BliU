import 'package:flutter/material.dart';

class AlarmItemWidget extends StatelessWidget {
  const AlarmItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/app_resource/icon.png',
                fit: BoxFit.fitHeight,
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 21, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('공지'),
                      Text('여름 신상 레인코트 입고 안내')
                    ],
                  ),
                  SizedBox(
                    child: Text('여러분 안녕하세요! 장마철을 대비해 새롭게 입고된 여름 신상 레인코트를 소개합니다. 다양한 디자인과 컬러로 구성되어 있어 아이들이 더욱 즐겁게 장마철...'),
                  ),
                  SizedBox(
                    child: Text('2023-01-01'),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 28, 0, 0),
            width: 14,
            height: 14,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}