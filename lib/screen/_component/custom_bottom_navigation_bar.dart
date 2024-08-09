import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // 'flutter_svg' 패키지 이름에 오타가 있어서 수정했습니다.

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _buildNavItem(
          index: 0,
          iconPath: 'assets/images/home/bottom_store.svg',
          label: 'home',
        ),
        _buildNavItem(
          index: 1,
          iconPath: 'assets/images/home/bottom_like.svg',
          label: 'like',
        ),
        _buildNavItem(
          index: 2,
          iconPath: 'assets/images/home/bottom_home.svg',
          label: 'store',
        ),
        _buildNavItem(
          index: 3,
          iconPath: 'assets/images/home/bottom_cate.svg',
          label: 'cate',
        ),
        _buildNavItem(
          index: 4,
          iconPath: 'assets/images/home/bottom_my.svg',
          label: 'my',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
      backgroundColor: Colors.white, // 바 배경 색상 설정
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required String iconPath,
    required String label,
  }) {
    bool isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            iconPath,
            color: Colors.black,
          ),
          if (isSelected)
            Positioned(
              top: -7,
              right: 0,
              left: 0,
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6192), // 분홍색 동그라미
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}
