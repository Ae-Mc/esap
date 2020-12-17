import 'package:esap/generated/l10n.dart';
import 'package:esap/routes.dart';
import 'package:esap/screens/Home/screens/FocusedSearch/widgets/AddFilter.dart';
import 'package:esap/style.dart';
import 'package:esap/widgets/MyDivider.dart';
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
  String searchText;

  @override
  void initState() {
    searchText = widget.searchText;
    super.initState();
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
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (_) => AddFilter(),
              backgroundColor: Colors.transparent,
            ),
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
