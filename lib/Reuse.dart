import 'package:flutter/material.dart';

class Reuse extends StatelessWidget {
  Reuse({required this.col,required  this.cardproperty});

 late  final Color col;
 late final Widget cardproperty;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardproperty != null ? cardproperty : null, // handle here
    );
  }
}
