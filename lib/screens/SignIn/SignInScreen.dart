import 'package:esap/generated/l10n.dart';
import 'package:esap/routes.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:esap/widgets/EmailInputField.dart';
import 'package:esap/widgets/HeaderTexts.dart';
import 'package:esap/widgets/PasswordInputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverflowBox(
        maxHeight: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderTexts(S.current.Welcome, S.current.PleaseEnterAccountData),
              SizedBox(height: 32),
              ..._inputFields(context),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .popAndPushNamed(PasswordRecoveryRoute),
                  child: Text(
                    S.current.ForgotYourPassword,
                    style: TextStyle(color: mainTextColor),
                  ),
                ),
              ),
              SizedBox(height: 72),
              _bottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _inputFields(BuildContext context) {
    return [
      EmailInputField(),
      SizedBox(height: 16),
      PasswordInputField(),
    ];
  }

  Widget _bottomButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          onTap: () => Navigator.of(context).pop(),
          color: primaryColor,
          child: Text.rich(
            TextSpan(
              text: S.current.Enter,
              style:
                  TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
            ),
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        SizedBox(height: 24),
        Text(S.current.OrUseAccount),
        SizedBox(height: 24),
        CustomButton(
          color: accentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  "assets/icons/Google.svg",
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 15,
                  height: 16,
                ),
              ),
              SizedBox(width: 9),
              Text.rich(
                TextSpan(
                  text: S.current.Google,
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.DontHaveAnAccount,
              style: TextStyle(color: mainTextColor),
            ),
            SizedBox(width: 9),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).popAndPushNamed(RegistrationRoute),
              child: Text(
                S.current.Registration,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
