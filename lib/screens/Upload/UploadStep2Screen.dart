import 'package:esap/generated/l10n.dart';
import 'package:esap/main.dart';
import 'package:esap/screens/Upload/UploadSuccessScreen.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:esap/widgets/InputTextField.dart';
import 'package:esap/widgets/MyDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadStep2Screen extends StatefulWidget {
  createState() => _UploadStep2Screen();
}

class _UploadStep2Screen extends State<UploadStep2Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 56),
                    _headerTexts(context),
                    SizedBox(height: 47),
                    _estimatedSolution(context),
                    SizedBox(height: 24),
                  ],
                ),
              ),
              MyDivider(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 24),
                      _solutionSteps(context),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _nextButton(context),
                            SizedBox(height: 37),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerTexts(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.popUntil(
            context,
            ModalRoute.withName(HomeRoute),
          ),
          child: Text(
            S.current.Cancel,
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: accentColor),
          ),
        ),
        Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "2/",
                style: TextStyle(color: mainTextColor),
              ),
              TextSpan(
                text: "2",
                style: TextStyle(color: secondaryTextColor),
              ),
            ]),
            style: Theme.of(context).textTheme.headline2),
      ],
    );
  }

  Widget _estimatedSolution(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.current.EstimatedSolution,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 26),
        _solutionRow(context, S.current.EnterServiceName),
        SizedBox(height: 24),
        _solutionRow(context, S.current.AddYourOption),
        SizedBox(height: 32),
        CustomButton(
          color: Colors.transparent,
          border: Border.all(color: outlineColor, width: 1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close, size: 30, color: mainTextColor),
              SizedBox(width: 7),
              Text(
                S.current.IDontKnowTheSolution,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: mainTextColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _solutionRow(BuildContext context, String text) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            "assets/icons/SixDots.svg",
            color: secondaryTextColor,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: InputTextField(
            hintText: text,
          ),
        ),
      ],
    );
  }

  Widget _solutionSteps(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.SolutionSteps,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 18),
        _solutionStep(context, "1"),
      ],
    );
  }

  Widget _solutionStep(BuildContext context, String code) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: headerColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                code,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                "assets/icons/SixDots.svg",
                color: secondaryTextColor,
              ),
            ),
          ],
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: outlineColor, width: 1),
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: S.current.EnterDescription,
                    hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: secondaryTextColor,
                        ),
                  ),
                  maxLines: 6,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: formColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    "assets/icons/Camera.svg",
                    color: headerColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _nextButton(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          expandable: true,
          onTap: () => Navigator.pop(context),
          color: formColor,
          child: Text(
            S.current.Back,
            style: Theme.of(context).textTheme.headline3.copyWith(
                  color: mainTextColor,
                ),
          ),
        ),
        SizedBox(width: 15),
        CustomButton(
          expandable: true,
          onTap: () => showDialog(
            context: context,
            builder: (context) => UploadSuccessScreen(),
          ),
          child: Text(
            S.current.Next,
            style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
        ),
      ],
    );
  }
}
