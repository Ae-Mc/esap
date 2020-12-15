import 'package:esap/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderTexts extends StatelessWidget {
  final String text1, text2;

  HeaderTexts(this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(color: mainTextColor),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          text2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
