import 'package:esap/generated/l10n.dart';
import 'package:esap/routes.dart';
import 'package:esap/models/Category.dart';
import 'package:esap/states/DataState.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/BottomTabBar.dart';
import 'package:esap/widgets/MyDivider.dart';
import 'package:esap/widgets/ProblemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _chosenCategory;

  @override
  void initState() {
    _chosenCategory = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _topSection(context),
          SizedBox(height: 24),
          MyDivider(),
          SizedBox(height: 6),
          Expanded(
            child: _tabs(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomTabBar(
        selectedTab: 0,
      ),
    );
  }

  Widget _topSection(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Hero(
            tag: "Search",
            child: Material(
              color: Colors.transparent,
              child: _searchBox(context),
            ),
          ),
          SizedBox(height: 24),
          _category(context)
        ],
      ),
    );
  }

  Widget _searchBox(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, FocusedSearchRoute),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Flexible(
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: S.current.Search,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: formColor,
        ),
      ),
    );
  }

  Widget _category(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.Category,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 48,
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
                    color:
                        isChosen ? Theme.of(context).primaryColor : formColor,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                  margin: isLatest ? null : EdgeInsets.only(right: 7),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        text: category.name,
                        style: TextStyle(
                            color:
                                isChosen ? Colors.white : secondaryTextColor,
                            fontWeight: isChosen ? FontWeight.w700 : null),
                      ),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _tabs(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: indicatorColor,
          tabs: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text.rich(
                TextSpan(
                  text: S.current.News,
                  style: TextStyle(color: headerColor),
                ),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text.rich(
                TextSpan(
                  text: S.current.Near,
                  style: TextStyle(color: headerColor),
                ),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _news(context),
            _near(),
          ],
        ),
      ),
    );
  }

  Widget _news(BuildContext context) {
    return ProblemList(Provider.of<DataState>(context).problems);
  }

  Widget _near() {
    return Container(
      color: Colors.red,
    );
  }
}
