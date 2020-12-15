import 'package:esap/generated/l10n.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/InputTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailInputField extends StatefulWidget {
  final String hintText;

  EmailInputField({this.hintText});

  createState() => _EmailInputField();
}

class _EmailInputField extends State<EmailInputField> {
  @override
  Widget build(BuildContext context) {
    return InputTextField(
      leftIcon: SvgPicture.asset(
        "assets/icons/Message.svg",
        width: 19,
        height: 17,
        color: mainTextColor,
      ),
      hintText: widget.hintText == null
          ? S.current.EmailOrPhoneNumber
          : widget.hintText,
      textStyle:
          Theme.of(context).textTheme.bodyText2.copyWith(color: mainTextColor),
    );
  }
}
