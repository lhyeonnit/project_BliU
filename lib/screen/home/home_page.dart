import 'package:bliu/screen/home/component/home_body_ai.dart';
import 'package:bliu/screen/home/component/home_body_best_seles.dart';
import 'package:bliu/screen/home/component/home_body_category.dart';
import 'package:bliu/screen/home/component/home_body_exhibition.dart';
import 'package:bliu/screen/home/component/home_footer.dart';
import 'package:bliu/screen/home/component/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 50 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: _isScrolled ? Colors.white : Colors.transparent,
                  expandedHeight: 625.0,
                  title: Text(
                    'BliU',
                    style: TextStyle(
                      color: _isScrolled ? Colors.black : Colors.white,
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: HomeHeader(),
                  ),
                  actions: [
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/home/ic_top_sch_w.svg",
                        color: _isScrolled ? Colors.black : Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/home/ic_smart_w.svg",
                        color: _isScrolled ? Colors.black : Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/home/ic_cart_w.svg",
                        color: _isScrolled ? Colors.black : Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      HomeBodyCategory(),
                      HomeBodyAi(),
                      HomeBodyExhibition(),
                      HomeBodyBestSeles(),
                      HomeFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
