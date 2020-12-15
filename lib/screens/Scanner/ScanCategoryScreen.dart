import 'package:esap/generated/l10n.dart';
import 'package:esap/main.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/BottomTabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanCategoryScreen extends StatefulWidget {
  createState() => _ScanCategoryScreen();
}

class _ScanCategoryScreen extends State<ScanCategoryScreen> {
  int _chosenCategory = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 425,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24, top: 32, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.close,
                            color: headerColor,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        S.current.SelectACategory,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              height: 22 / 17,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 29),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          _chosenCategory = 0;
                        }),
                        child: _categoryContainer(
                          context,
                          "assets/icons/Roads.svg",
                          S.current.Roads,
                          _chosenCategory == 0,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() {
                          _chosenCategory = 1;
                        }),
                        child: _categoryContainer(
                          context,
                          "assets/icons/Courtyards.svg",
                          S.current.Courtyards,
                          _chosenCategory == 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: BottomTabBar(
              scannerAction: () =>
                  Navigator.pushReplacementNamed(context, ScannerRoute),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _categoryContainer(
    BuildContext context,
    String svgAsset,
    String name,
    bool isSelected,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 38, top: 44, right: 38, bottom: 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: outlineColor, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgAsset,
            width: 80,
            height: 80,
            color: isSelected ? primaryColor : mainTextColor,
          ),
          SizedBox(height: 16),
          Text(
            name,
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
