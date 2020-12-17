import 'package:esap/routes.dart';
import 'package:esap/screens/Scanner/ScanCategoryScreen.dart';
import 'package:esap/states/DataState.dart';
import 'package:esap/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class BottomTabBar extends StatefulWidget {
  final Function scannerAction;
  final int selectedTab;

  BottomTabBar({this.scannerAction, this.selectedTab = 0});

  @override
  createState() => _BottomTabBar();
}

class _BottomTabBar extends State<BottomTabBar> {
  int selectedTab;

  @override
  void initState() {
    selectedTab = widget.selectedTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: backgroundColor, boxShadow: [
        BoxShadow(
            color: Color(0xFF0046CF).withOpacity(0.03),
            blurRadius: 56,
            spreadRadius: 8,
            offset: Offset(0, -4)),
      ]),
      child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 45,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => selectedTab != 0
                      ? Navigator.pushReplacementNamed(context, HomeRoute)
                      : null,
                  child: SvgPicture.asset(
                    "assets/icons/Home.svg",
                    color: _color(0),
                    width: 24,
                    height: 24,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, UploadStep1Route),
                  child: SvgPicture.asset(
                    "assets/icons/Edit.svg",
                    color: _color(1),
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(
                  width: 56,
                ),
                SvgPicture.asset(
                  "assets/icons/Notification.svg",
                  color: _color(2),
                  width: 24,
                  height: 24,
                ),
                GestureDetector(
                  onTap: () => selectedTab != 3
                      ? Navigator.pushReplacementNamed(
                          context,
                          MyProfileRoute,
                          arguments: {
                            "user": Provider.of<DataState>(
                              context,
                              listen: false,
                            ).getAuthorById(0),
                          },
                        )
                      : null,
                  child: SvgPicture.asset(
                    "assets/icons/Profile.svg",
                    color: _color(3),
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 47,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.scannerAction == null
                  ? () => showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ScanCategoryScreen(),
                      )
                  : widget.scannerAction,
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/Scan.svg",
                    color: Colors.white,
                    width: 22,
                    height: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _color(int index) {
    return index == selectedTab ? primaryColor : secondaryTextColor;
  }
}
