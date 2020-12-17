import 'package:esap/states/DataState.dart';
import 'package:provider/provider.dart';
import 'package:esap/generated/l10n.dart';
import 'package:esap/models/Category.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFilter extends StatefulWidget {
  createState() => _AddFilter();
}

class _AddFilter extends State<AddFilter> {
  int _chosenCategory = 0;
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          Text(
            S.current.AddFilter,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 32),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.Categories,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 16),
                _categoriesList(context),
                SizedBox(height: 32),
                ..._slider(context),
                SizedBox(height: 52),
                _bottomButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesList(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Provider.of<DataState>(context).categories.length,
        itemBuilder: (context, index) {
          Category category =
              Provider.of<DataState>(context).categories.elementAt(index);
          bool isChosen = category.id == _chosenCategory;
          bool isLatest =
              index == Provider.of<DataState>(context).categories.length - 1;

          return GestureDetector(
            onTap: () {
              setState(() {
                _chosenCategory = category.id;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isChosen
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                border: isChosen
                    ? null
                    : Border.all(
                        color: outlineColor,
                        width: 2,
                      ),
                borderRadius: BorderRadius.circular(32),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
              margin: isLatest ? null : EdgeInsets.only(right: 7),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: category.name,
                    style: TextStyle(
                        color: isChosen ? Colors.white : secondaryTextColor,
                        fontWeight: isChosen ? FontWeight.w700 : null),
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _slider(BuildContext context) {
    return [
      Text(
        S.current.UrgencyOfTheDecision,
        style: Theme.of(context).textTheme.headline2,
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

  Widget _bottomButtons(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onTap: () => Navigator.pop(context),
          expandable: true,
          color: formColor,
          child: Text(
            S.current.Cancel,
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: mainTextColor),
          ),
        ),
        SizedBox(width: 15),
        CustomButton(
          onTap: () => Navigator.pop(context),
          expandable: true,
          color: primaryColor,
          child: Text(
            S.current.Done,
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
