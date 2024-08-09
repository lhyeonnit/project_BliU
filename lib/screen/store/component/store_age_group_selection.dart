import 'package:flutter/material.dart';

class StoreAgeGroupSelection extends StatefulWidget {
  final List<String> selectedAgeGroups;
  final ValueChanged<List<String>> onSelectionChanged;

  const StoreAgeGroupSelection({
    required this.selectedAgeGroups,
    required this.onSelectionChanged,
    Key? key,
  }) : super(key: key);

  @override
  _StoreAgeGroupSelectionState createState() => _StoreAgeGroupSelectionState();
}

class _StoreAgeGroupSelectionState extends State<StoreAgeGroupSelection> {
  late List<String> _tempSelectedAgeGroups;

  @override
  void initState() {
    super.initState();
    _tempSelectedAgeGroups = List.from(widget.selectedAgeGroups);
  }

  void _toggleSelection(String ageGroup) {
    setState(() {
      if (_tempSelectedAgeGroups.contains(ageGroup)) {
        _tempSelectedAgeGroups.remove(ageGroup);
      } else {
        _tempSelectedAgeGroups.add(ageGroup);
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
            '연령대',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildAgeGroupChip('베이비(0-24개월)'),
              _buildAgeGroupChip('키즈(3-8세)'),
              _buildAgeGroupChip('주니어(9세이상)'),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _tempSelectedAgeGroups.clear();
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  widget.onSelectionChanged(_tempSelectedAgeGroups);
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

  Widget _buildAgeGroupChip(String ageGroup) {
    final isSelected = _tempSelectedAgeGroups.contains(ageGroup);
    return GestureDetector(
      onTap: () => _toggleSelection(ageGroup),
      child: Chip(
        label: Text(
          ageGroup,
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
        backgroundColor: isSelected ? Colors.pink[50] : Colors.white,
      ),
    );
  }
}
