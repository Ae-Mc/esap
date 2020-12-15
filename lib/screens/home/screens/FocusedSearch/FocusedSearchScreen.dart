import 'package:esap/generated/l10n.dart';
import 'package:esap/main.dart';
import 'package:esap/screens/home/screens/FocusedSearch/widgets/AddFilter.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/MyDivider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FocusedSearchScreen extends StatefulWidget {
  final String searchText;

  FocusedSearchScreen({this.searchText = ""});

  @override
  createState() => _FocusedSearchScreen();
}

class _FocusedSearchScreen extends State<FocusedSearchScreen>
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
          SizedBox(height: 24),
          _historySection(context),
          SizedBox(height: 24),
          MyDivider(),
          SizedBox(height: 24),
          _relatedSearchesSection(context),
        ],
      ),
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
            onTap: () {
              Navigator.push(context, MyPopupRoute());
            },
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
              color: Color(0xFF3E5481),
            ),
            SizedBox(
              width: 11,
            ),
            Expanded(
              child: TextField(
                onChanged: (String value) => searchText = value,
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
                onSubmitted: (String value) => Navigator.popAndPushNamed(
                    context, SubmittedSearchRoute,
                    arguments: {"searchText": searchText}),
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

  Widget _historySection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _historyEntry(context, "Ремонт дорог"),
          SizedBox(height: 24),
          _historyEntry(context, "Ремонт коммуникаций"),
        ],
      ),
    );
  }

  Widget _historyEntry(BuildContext context, String searchText) {
    return Row(
      children: [
        Icon(Icons.access_time_rounded, size: 24, color: secondaryTextColor),
        SizedBox(width: 17),
        Text(searchText, style: Theme.of(context).textTheme.bodyText1),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              child: SvgPicture.asset(
                "assets/icons/ArrowUpLeft.svg",
                color: secondaryTextColor,
              ),
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _relatedSearchesSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.current.RelatedSearches,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 24),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            spacing: 11,
            runSpacing: 16,
            children: [
              textBox(context, "Ямы"),
              textBox(context, "Светофоры"),
              textBox(context, "Аварии"),
              textBox(context, "Тротуары"),
            ],
          ),
        ],
      ),
    );
  }

  Widget textBox(BuildContext context, String text) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints.tightFor(),
          decoration: BoxDecoration(
            color: formColor,
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: mainTextColor),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPopupRoute extends PopupRoute<void> {
  @override
  Color get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;
  @override
  String get barrierLabel => "Close";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Scaffold(
      backgroundColor: barrierColor,
      body: Stack(
        children: [
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromSize(
                Rect.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height + 467,
                ),
                MediaQuery.of(context).size,
              ),
              end: RelativeRect.fromSize(
                Rect.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height - 467,
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height,
                ),
                MediaQuery.of(context).size,
              ),
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
            ),
            child: Material(
              elevation: 20,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: AddFilter(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
