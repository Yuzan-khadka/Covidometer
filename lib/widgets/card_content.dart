import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardContent extends StatelessWidget {
  final String label;
  final String assetPath;
  final String casesNumber;
  CardContent({this.assetPath, this.casesNumber, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SvgPicture.asset(assetPath),
        SizedBox(
          height: 20.0,
        ),
        Text(
          casesNumber,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
