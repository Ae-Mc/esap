import 'package:esap/generated/l10n.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/InputTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordInputField extends StatefulWidget {
  final String hintText;

  PasswordInputField({this.hintText});

  createState() => _PasswordInputField();
}

class _PasswordInputField extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return InputTextField(
      leftIcon: SvgPicture.asset(
        "assets/icons/Lock.svg",
        width: 19,
        height: 17,
        color: mainTextColor,
      ),
      rightIcons: [
        SvgPicture.asset(
          "assets/icons/EyeCrossed.svg",
          color: secondaryTextColor,
        ),
        SvgPicture.asset(
          "assets/icons/Eye.svg",
          color: secondaryTextColor,
        ),
      ],
      hintText: S.current.Password,
      textStyle:
          Theme.of(context).textTheme.bodyText2.copyWith(color: headerColor),
    );
  }
}
