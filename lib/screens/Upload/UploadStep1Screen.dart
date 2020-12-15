import 'package:dotted_border/dotted_border.dart';
import 'package:esap/generated/l10n.dart';
import 'package:esap/main.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:esap/widgets/InputTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadStep1Screen extends StatefulWidget {
  createState() => _UploadStep1Screen();
}

class _UploadStep1Screen extends State<UploadStep1Screen> {
  double _sliderValue;

  @override
  void initState() {
    _sliderValue = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),
                _headerTexts(context),
                SizedBox(height: 32),
                _imageBox(context),
                SizedBox(height: 24),
                ..._problemName(context),
                SizedBox(height: 24),
                ..._problemDescription(context),
                SizedBox(height: 24),
                ..._problemImportance(context),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _nextButton(context),
                      SizedBox(height: 37),
                    ],
                  ),
                )
              ],
            ),
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
          onTap: () => Navigator.pop(context),
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
                text: "1/",
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

  Widget _imageBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: outlineColor,
        dashPattern: [8, 4],
        strokeCap: StrokeCap.round,
        strokeWidth: 2,
        radius: Radius.circular(16),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 17),
              SizedBox(
                height: 64,
                width: 64,
                child: SvgPicture.asset("assets/icons/Image.svg",
                    color: secondaryTextColor),
              ),
              SizedBox(height: 16),
              Text(
                S.current.AddPhoto,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 8),
              Text(
                S.current.noMoreThan12Mb,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: secondaryTextColor,
                    ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _problemName(BuildContext context) {
    return [
      Text(
        S.current.ProblemName,
        style: Theme.of(context).textTheme.headline2,
      ),
      SizedBox(height: 10),
      InputTextField(
        hintText: S.current.EnterProblemName,
      ),
    ];
  }

  List<Widget> _problemDescription(BuildContext context) {
    return [
      Text(
        S.current.ProblemDescription,
        style: Theme.of(context).textTheme.headline2,
      ),
      SizedBox(height: 10),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: outlineColor, width: 1),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: S.current.EnterDescription,
            hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: secondaryTextColor,
                ),
          ),
          maxLines: 4,
        ),
      ),
    ];
  }

  List<Widget> _problemImportance(BuildContext context) {
    return [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: S.current.AssessTheImportanceOfTheIssue,
              style: Theme.of(context).textTheme.headline2,
            ),
            TextSpan(text: ' '),
            TextSpan(
              text: "(?)",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: secondaryTextColor,
                  ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16),
      Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "<1      ",
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color: _sliderValue >= 1 ? primaryColor : secondaryTextColor),
            ),
            Text(
              "50",
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color:
                      _sliderValue >= 50 ? primaryColor : secondaryTextColor),
            ),
            Text(
              ">100",
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color:
                      _sliderValue >= 100 ? primaryColor : secondaryTextColor),
            ),
          ],
        ),
      ),
      SizedBox(height: 16),
      SliderTheme(
        data: SliderThemeData(
          trackHeight: 8,
          activeTrackColor: primaryColor,
          thumbColor: primaryColor,
          inactiveTrackColor: formColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
        ),
        child: Slider(
          value: _sliderValue,
          min: 0,
          max: 100,
          label: _sliderValue.round().toString(),
          onChanged: (double value) => setState(() {
            _sliderValue = value;
          }),
        ),
      ),
    ];
  }

  Widget _nextButton(BuildContext context) {
    return CustomButton(
      onTap: () => Navigator.pushNamed(context, UploadStep2Route),
      child: Text(
        S.current.Next,
        style: Theme.of(context).textTheme.headline3.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
      ),
    );
  }
}
