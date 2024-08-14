import 'package:flutter/material.dart';

class ProductInfoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text(
          'Product Banner',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
