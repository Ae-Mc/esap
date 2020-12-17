import 'package:esap/generated/l10n.dart';
import 'package:esap/routes.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:esap/widgets/HeaderTexts.dart';
import 'package:esap/widgets/PasswordInputField.dart';
import 'package:flutter/material.dart';

class PasswordResetScreen extends StatefulWidget {
  PasswordResetScreen();

  createState() => _PasswordResetScreen();
}

class _PasswordResetScreen extends State<PasswordResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverflowBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderTexts(S.current.PasswordReset, S.current.EnterNewPassword),
              SizedBox(height: 24),
              PasswordInputField(),
              SizedBox(height: 24),
              _passwordShouldContain(context),
              SizedBox(height: 24),
              _bottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordShouldContain(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: S.current.YourPasswordShouldContain,
          ),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 16),
        _checkedRow(context, S.current.AtLeast6Characters, isActive: true),
        SizedBox(height: 16),
        _checkedRow(context, S.current.ContainSymbol, isActive: false),
      ],
    );
  }

  Widget _checkedRow(BuildContext context, String text,
      {@required bool isActive}) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? greenSubtleColor
                : secondaryTextColor.withOpacity(0.2),
          ),
          child: Icon(
            Icons.check_rounded,
            size: 12,
            color: isActive ? primaryColor : secondaryTextColor,
          ),
        ),
        SizedBox(width: 8),
        Text.rich(
          TextSpan(
            text: text,
            style: TextStyle(color: isActive ? mainTextColor : null),
          ),
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Widget _bottomButtons(BuildContext context) {
    return CustomButton(
      onTap: () => Navigator.of(context).popUntil(ModalRoute.withName(HomeRoute)),
      child: Text.rich(
        TextSpan(
          text: S.current.Done,
          style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
        ),
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
