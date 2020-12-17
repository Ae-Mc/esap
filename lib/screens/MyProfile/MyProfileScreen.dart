import 'package:esap/generated/l10n.dart';
import 'package:esap/models/Problem.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/BottomTabBar.dart';
import 'package:esap/widgets/MyDivider.dart';
import 'package:esap/widgets/ProblemList.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 56),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.share_rounded, size: 24, color: mainTextColor),
                  ],
                ),
                SizedBox(height: 20),
                ClipOval(
                  child: Image.asset(
                    "assets/images/author_01.jpg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Даниил Сучков",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _counter(23, S.current.Problems),
                    _counter(42, S.current.Following),
                    _counter(17, S.current.HelpedToSolve),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          MyDivider(),
          Expanded(
            child: _tabs(context),
          ),
        ],
      ),
      bottomNavigationBar: BottomTabBar(selectedTab: 3),
    );
  }

  Widget _counter(int count, String text) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            count.toString(),
            style: textTheme.headline2,
          ),
          SizedBox(height: 2),
          Text(
            text,
            style: textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
                  text: S.current.Problems,
                  style: TextStyle(color: headerColor),
                ),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: Text.rich(
                TextSpan(
                  text: S.current.Following,
                  style: TextStyle(color: headerColor),
                ),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _problems(),
            _following(),
          ],
        ),
      ),
    );
  }

  Widget _problems() {
    return ProblemList(Problem.allProblems());
  }

  Widget _following() {
    return Container(
      color: Colors.red,
    );
  }
}
