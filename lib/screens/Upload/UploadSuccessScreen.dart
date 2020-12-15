import 'package:esap/generated/l10n.dart';
import 'package:esap/main.dart';
import 'package:esap/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(left: 28, top: 60, right: 28, bottom: 48),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.TheProblemHasBeenProcessed,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    height: 16 / 11,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48),
            Text(
              S.current.YouHaveSuccessfullyAddedTheProblem +
                  '\n' +
                  S.current.ItWillBeAdded_YouWillReceiveANotification,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: mainTextColor,
                    height: 5 / 3,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () => Navigator.popUntil(
                context,
                ModalRoute.withName(HomeRoute),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 37, vertical: 19),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: primaryColor,
                ),
                child: Text(
                  S.current.ProblemCard,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
