import 'package:flutter/material.dart';

class StyleSelectionSheet extends StatefulWidget {
  final List<String> selectedStyles;
  final ValueChanged<List<String>> onSelectionChanged;

  const StyleSelectionSheet({
    required this.selectedStyles,
    required this.onSelectionChanged,
    Key? key,
  }) : super(key: key);

  @override
  _StyleSelectionSheetState createState() => _StyleSelectionSheetState();
}

class _StyleSelectionSheetState extends State<StyleSelectionSheet> {
  late List<String> _tempSelectedStyles;

  @override
  void initState() {
    super.initState();
    _tempSelectedStyles = List.from(widget.selectedStyles);
  }

  void _toggleSelection(String style) {
    setState(() {
      if (_tempSelectedStyles.contains(style)) {
        _tempSelectedStyles.remove(style);
      } else {
        _tempSelectedStyles.add(style);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '스타일',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildStyleChip('캐주얼 (Casual)'),
              _buildStyleChip('스포티 (Sporty)'),
              _buildStyleChip('포멀 / 클래식 (Formal/Classic)'),
              _buildStyleChip('베이직 (Basic)'),
              _buildStyleChip('프린세스 / 페어리 (Princess/Fairy)'),
              _buildStyleChip('힙스터 (Hipster)'),
              _buildStyleChip('럭셔리 (Luxury)'),
              _buildStyleChip('어반 스트릿 (Urban Street)'),
              _buildStyleChip('로맨틱 (Romantic)'),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _tempSelectedStyles.clear();
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  widget.onSelectionChanged(_tempSelectedStyles);
                  Navigator.pop(context);
                },
                child: const Text('선택완료'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStyleChip(String style) {
    final isSelected = _tempSelectedStyles.contains(style);
    return GestureDetector(
      onTap: () => _toggleSelection(style),
      child: Chip(
        label: Text(
          style,
          style: TextStyle(
            color: isSelected ? Colors.pink : Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        shape: StadiumBorder(
          side: BorderSide(
            color: isSelected ? Colors.pink : Colors.grey,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
