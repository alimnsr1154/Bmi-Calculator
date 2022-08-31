import 'inputpage.dart';
import 'package:flutter/material.dart';

class Iconic extends StatelessWidget {
  Iconic({required this.ic, required this.str});
  late final IconData ic;
  late final String str;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ic,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          str,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
