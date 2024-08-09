import 'package:bliu/screen/store/component/store_age_group_selection.dart';
import 'package:bliu/screen/store/component/store_style_group_selection.dart';
import 'package:flutter/material.dart';

import 'dummy/store_product.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<String> selectedAgeGroups = [];
  List<String> selectedStyles = [];

  void _showAgeGroupSelection() {
    showModalBottomSheet(
      context: context,
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
      return '연령대 선택';
    } else {
      return selectedAgeGroups.join(', ');
    }
  }

  String getSelectedStylesText() {
    if (selectedStyles.isEmpty) {
      return '스타일 선택';
    } else {
      return selectedStyles.join(', ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('스토어'),
      ),
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
                                SizedBox(height: 4),
                                Text(
                                  stores[index]['description'],
                                  style: TextStyle(color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.bookmark_border),
                            onPressed: () {},
                          ),
                          Text(
                            stores[index]['scrapCount'],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
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
                                  stores[index]['scrapCount'],
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
