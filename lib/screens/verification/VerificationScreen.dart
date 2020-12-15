import 'package:esap/generated/l10n.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  final String nextRoute;

  VerificationScreen({@required this.nextRoute});

  createState() => _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                text: S.current.CheckMessages,
                style: TextStyle(color: mainTextColor),
              ),
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: S.current.WeHaveSentCodeToYourPhoneNumber,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            _pinCodeField(context),
            SizedBox(height: 48),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: S.current.theCodeIsValid,
                  style: TextStyle(color: mainTextColor),
                ),
                TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: "3:12",
                  style: TextStyle(color: accentColor),
                ),
              ]),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 24),
            _bottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _pinCodeField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      onChanged: (String text) => null,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(20),
        borderWidth: 2,
        inactiveColor: outlineColor,
        selectedColor: indicatorColor,
        activeColor: outlineColor,
        fieldWidth: 72,
        fieldHeight: 72,
      ),
      cursorColor: indicatorColor,
      textStyle: Theme.of(context)
          .textTheme
          .bodyText2
          .copyWith(color: headerColor, fontSize: 34),
      keyboardType: TextInputType.number,
    );
  }

  Widget _bottomButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          onTap: () => widget.nextRoute == null
              ? Navigator.of(context).pop()
              : Navigator.of(context).popAndPushNamed(widget.nextRoute),
          color: primaryColor,
          child: Text.rich(
            TextSpan(
              text: S.current.Confirm,
              style:
                  TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
            ),
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(height: 16),
        CustomButton(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: outlineColor, width: 2),
          child: Text.rich(
            TextSpan(
              text: S.current.Resend,
              style: TextStyle(color: secondaryTextColor),
            ),
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}
