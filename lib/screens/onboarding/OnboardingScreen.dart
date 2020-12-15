import 'package:esap/generated/l10n.dart';
import 'package:esap/main.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 43),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _images(),
                _text(context),
                _button(context),
              ],
            ),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }

  Widget _images() {
    return Stack(
      children: [
        Image.asset(
          "assets/images/welcome_map.jpg",
          height: 498,
          fit: BoxFit.cover,
        ),
        Image.asset(
          "assets/images/welcome_photos.png",
          fit: BoxFit.cover,
          height: 454,
        ),
      ],
    );
  }

  Widget _text(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/@ESAP.png",
              width: 100,
            ),
            SizedBox(width: 9),
            Image.asset("assets/images/КАНСК.png"),
          ],
        ),
        SizedBox(height: 28),
        Text(
          'Сделаем жизнь  города лучше. Вместе.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _button(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton(
        onTap: () => Navigator.of(context).popAndPushNamed(SignInRoute),
        child: Text.rich(
          TextSpan(
            text: S.current.Start,
            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
          ),
          style: Theme.of(context).textTheme.headline3,
        ),
        color: primaryColor,
      ),
    );
  }
}
