import 'package:flutter/material.dart';

class ProductFilterBottom extends StatelessWidget {
  final List<String> ageOptions;
  final List<String> styleOptions;
  final String selectedAgeOption;
  final String selectedStyleOption;
  final ValueChanged<String> onAgeOptionSelected;
  final ValueChanged<String> onStyleOptionSelected;

  const ProductFilterBottom({
    Key? key,
    required this.ageOptions,
    required this.styleOptions,
    required this.selectedAgeOption,
    required this.selectedStyleOption,
    required this.onAgeOptionSelected,
    required this.onStyleOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '연령',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: ageOptions.map((String option) {
                return ChoiceChip(
                  label: Text(option),
                  selected: selectedAgeOption == option,
                  selectedColor: Colors.pinkAccent,
                  onSelected: (bool selected) {
                    onAgeOptionSelected(option);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 32),
            Text(
              '스타일',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: styleOptions.map((String option) {
                return ChoiceChip(
                  label: Text(option),
                  selected: selectedStyleOption == option,
                  selectedColor: Colors.pinkAccent,
                  onSelected: (bool selected) {
                    onStyleOptionSelected(option);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 32),
            Text(
              '가격',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            RangeSlider(
              values: RangeValues(0, 100000),
              min: 0,
              max: 100000,
              onChanged: (RangeValues values) {},
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('상품보기'),
            ),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, {
    required List<String> ageOptions,
    required List<String> styleOptions,
    required String selectedAgeOption,
    required String selectedStyleOption,
    required ValueChanged<String> onAgeOptionSelected,
    required ValueChanged<String> onStyleOptionSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: ProductFilterBottom(
            ageOptions: ageOptions,
            styleOptions: styleOptions,
            selectedAgeOption: selectedAgeOption,
            selectedStyleOption: selectedStyleOption,
            onAgeOptionSelected: onAgeOptionSelected,
            onStyleOptionSelected: onStyleOptionSelected,
          ),
        );
      },
    );
  }
}
