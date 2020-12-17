import 'package:esap/generated/l10n.dart';
import 'package:esap/routes.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:esap/widgets/EmailInputField.dart';
import 'package:esap/widgets/HeaderTexts.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  createState() => _PasswordRecoveryScreen();
}

class _PasswordRecoveryScreen extends State<PasswordRecoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderTexts(
              S.current.PasswordRecovery,
              S.current.EnterYourPhoneNumberOrEmailToResetYourPassword,
            ),
            SizedBox(height: 50),
            EmailInputField(),
            SizedBox(height: 32),
            CustomButton(
              color: primaryColor,
              onTap: () => Navigator.of(context).pushNamed(VerificationRoute,
                  arguments: {'nextRoute': PasswordResetRoute}),
              child: Text.rich(
                TextSpan(
                  text: S.current.Enter,
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
