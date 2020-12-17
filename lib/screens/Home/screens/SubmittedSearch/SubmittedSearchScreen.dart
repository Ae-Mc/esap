import 'package:esap/generated/l10n.dart';
import 'package:esap/states/DataState.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/BottomTabBar.dart';
import 'package:esap/widgets/MyDivider.dart';
import 'package:esap/widgets/ProblemList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SubmittedSearchScreen extends StatefulWidget {
  final String searchText;

  SubmittedSearchScreen(this.searchText);

  @override
  createState() => _SubmittedSearchScreen();
}

class _SubmittedSearchScreen extends State<SubmittedSearchScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  String searchText;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animationController.addStatusListener(animationStatusListener);
    searchText = widget.searchText;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animationStatusListener(AnimationStatus status) {
    print(status);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          _headerSection(context),
          SizedBox(height: 24),
          MyDivider(),
          Expanded(
            child: SingleChildScrollView(
              child: ProblemList(Provider.of<DataState>(context).problems),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomTabBar(),
    );
  }

  Widget _headerSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left_rounded,
              size: 32,
              color: mainTextColor,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Hero(
              tag: "Search",
              child: Material(
                color: Colors.transparent,
                child: _searchBox(context),
              ),
            ),
          ),
          SizedBox(width: 24),
          GestureDetector(
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/Filter.svg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBox(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: formColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 27,
            ),
            SvgPicture.asset(
              "assets/icons/Search.svg",
              width: 18,
              height: 18,
              color: headerColor,
            ),
            SizedBox(
              width: 11,
            ),
            Expanded(
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: mainTextColor),
                autofocus: true,
                decoration: InputDecoration(
                  hintText: S.current.Search,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                ),
                controller: TextEditingController(text: searchText),
              ),
            ),
            SizedBox(width: 5),
            GestureDetector(
              child: SvgPicture.asset(
                "assets/icons/ClearCircle.svg",
                color: mainTextColor,
                width: 20,
              ),
            ),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
