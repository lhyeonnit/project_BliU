import 'package:flutter/material.dart';
import 'package:bliu/screen/store/component/store_age_group_selection.dart';
import 'package:bliu/screen/store/component/store_style_group_selection.dart';

import '../dummy/store_ranking.dart';

class StoreRakingPage extends StatefulWidget {
  const StoreRakingPage({super.key});

  @override
  _StoreRakingPageState createState() => _StoreRakingPageState();
}

class _StoreRakingPageState extends State<StoreRakingPage> {
  List<String> selectedAgeGroups = [];
  List<String> selectedStyles = [];

  void _showAgeGroupSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StoreAgeGroupSelection(
          selectedAgeGroups: selectedAgeGroups,
          onSelectionChanged: (List<String> newSelection) {
            setState(() {
              selectedAgeGroups = newSelection;
            });
          },
        );
      },
    );
  }

  void _showStyleSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return StyleSelectionSheet(
          selectedStyles: selectedStyles,
          onSelectionChanged: (List<String> newSelection) {
            setState(() {
              selectedStyles = newSelection;
            });
          },
        );
      },
    );
  }

  String getSelectedAgeGroupsText() {
    if (selectedAgeGroups.isEmpty) {
      return '연령';
    } else {
      return selectedAgeGroups.join(', ');
    }
  }

  String getSelectedStylesText() {
    if (selectedStyles.isEmpty) {
      return '스타일';
    } else {
      return selectedStyles.join(', ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showAgeGroupSelection,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            getSelectedAgeGroupsText(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showStyleSelection,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            getSelectedStylesText(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${stores[index]['rank']}',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          CircleAvatar(
                            backgroundImage:
                            NetworkImage(stores[index]['logo']),
                            radius: 20,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stores[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                     stores[index]['description'],
                                  style: TextStyle(color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min, // 여백을 최소화하기 위해 mainAxisSize를 설정
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero, // 아이콘 버튼의 여백 없애기
                                    icon: Icon(Icons.bookmark_border),
                                    constraints: BoxConstraints(), // 아이콘 버튼의 기본 크기 제한 해제
                                    onPressed: () {},
                                  ),
                                  Text(
                                    stores[index]['scrapCount'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: stores[index]['images'].length,
                          itemBuilder: (context, imageIndex) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child:  AspectRatio(
                                aspectRatio: 1.0,
                                child: Image.network(
                                  stores[index]['images'][imageIndex],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[200],
                                      child: Center(
                                        child: Text(
                                          'Image not available',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
