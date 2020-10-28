import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget content;
  ReusableCard({this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1F1E33),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black87, offset: Offset(2, 5), blurRadius: 6.0)
        ],
      ),
      child: content,
    );
  }
}

