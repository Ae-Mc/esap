import 'package:esap/generated/l10n.dart';
import 'package:esap/models/User.dart';
import 'package:esap/widgets/GuaranteedImage.dart';
import 'package:provider/provider.dart';
import 'package:esap/states/DataState.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/CustomButton.dart';
import 'package:esap/widgets/MyDivider.dart';
import 'package:esap/widgets/ProblemList.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen(this.user);

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.chevron_left_rounded,
                          size: 35, color: mainTextColor),
                    ),
                    Icon(Icons.share_rounded, size: 24, color: mainTextColor),
                  ],
                ),
                SizedBox(height: 20),
                ClipOval(
                  child: GuaranteedImage(
                    user.imageAsset,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    color: secondaryTextColor,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  user.nickname,
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
                ),
                SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: CustomButton(
                    child: Text(
                      S.current.Follow,
                      style: textTheme.headline3.copyWith(
                        color: backgroundColor,
                      ),
                    ),
                  ),
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
    );
  }

  Widget _counter(int count, String text) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
            _problems(context),
            _following(),
          ],
        ),
      ),
    );
  }

  Widget _problems(BuildContext context) {
    return ProblemList(Provider.of<DataState>(context).problems);
  }

  Widget _following() {
    return Container(
      color: Colors.red,
    );
  }
}
