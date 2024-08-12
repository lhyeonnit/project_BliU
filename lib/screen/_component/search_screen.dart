//검색
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _searchHistory = [];
  List<String> _popularSearches = [
    '레인부츠', '새학기 등록', '여름옷', '썸머룩',
    '레인코트', '동원록', '수영복', '원피스',
    '가디건', '래시가드'
  ];
  List<String> _suggestedItems = [
    '우이동금순 안나 도션 레이스 베스트',
    '우이동금순 바디수트',
    '미니초원 후드티',
  ];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _searchHistory = prefs.getStringList('searchHistory') ?? [];
    });
  }

  _saveSearch(String search) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _searchHistory.add(search);
      prefs.setStringList('searchHistory', _searchHistory);
    });
  }

  _clearSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _searchHistory.clear();
      prefs.remove('searchHistory');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: '검색어를 입력해 주세요',
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              _saveSearch(value);
              _searchController.clear();
            }
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              String search = _searchController.text;
              if (search.isNotEmpty) {
                _saveSearch(search);
                _searchController.clear();
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _clearSearchHistory();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_searchHistory.isEmpty)
              Text('검색기록이 없습니다.', style: TextStyle(color: Colors.grey)),
            if (_searchHistory.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('최근 검색어'),
                  TextButton(
                    onPressed: _clearSearchHistory,
                    child: Text('전체삭제'),
                  ),
                ],
              ),
              Wrap(
                spacing: 8.0,
                children: _searchHistory.map((search) {
                  return Chip(
                    label: Text(search),
                    onDeleted: () {
                      setState(() {
                        _searchHistory.remove(search);
                      });
                    },
                  );
                }).toList(),
              ),
            ],
            SizedBox(height: 16.0),
            Text('인기 검색어'),
            GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _popularSearches.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                return Text('${index + 1}. ${_popularSearches[index]}');
              },
            ),
            SizedBox(height: 16.0),
            Text('이런 아이템은 어떠세요?'),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _suggestedItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150.0,
                    margin: EdgeInsets.only(right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/home/exhi.png',
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _suggestedItems[index],
                          overflow: TextOverflow.ellipsis, // 글자 생략 설정
                          maxLines: 1, // 한 줄로 제한
                        ),
                        Text(
                          '15% 32,800원',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis, // 글자 생략 설정
                          maxLines: 1, // 한 줄로 제한
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
