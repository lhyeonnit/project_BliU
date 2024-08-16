//스토어 상세
import 'package:bliu/screen/store/component/detail/store_category.dart';
import 'package:bliu/screen/store/component/detail/store_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoreDetailScreen extends StatelessWidget {
  const StoreDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/store/ic_back.svg"),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 동작
          },
        ),
      ),
      body: ListView(
        children: [
          StoreInfoPage(),
          const SizedBox(height: 16),
          StoreCategory(),
        ],
      ),
    );
  }
}
