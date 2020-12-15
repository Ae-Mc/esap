import 'dart:ui';

import 'package:esap/generated/l10n.dart';
import 'package:esap/models/Problem.dart';
import 'package:esap/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProblemDetailsScreen extends StatelessWidget {
  final Problem problem;

  ProblemDetailsScreen(this.problem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Image.asset(
                  problem.imageUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 60,
                  left: 24,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: ClipOval(
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                          child: Container(
                            color: Colors.white.withOpacity(0.2),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.chevron_left_rounded,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width - 32,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32)),
                      ),
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                            color: outlineColor,
                            borderRadius: BorderRadius.circular(2.5)),
                      )),
                ),
              ],
            ),
            SizedBox(height: 10),
            _content(context),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            problem.name,
            style: textTheme.headline2,
          ),
          SizedBox(height: 8),
          _categoryRow(),
          SizedBox(height: 16),
          _authorRow(),
          SizedBox(height: 16),
          Divider(color: outlineColor, thickness: 1),
          SizedBox(height: 16),
          _description(),
          SizedBox(height: 16),
          Divider(color: outlineColor, thickness: 1),
          SizedBox(height: 16),
          _necessaryResources(),
          SizedBox(height: 16),
          Divider(color: outlineColor, thickness: 1),
          SizedBox(height: 16),
          _solutionSteps(),
          SizedBox(height: 36),
        ],
      ),
    );
  }

  Widget _categoryRow() {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: problem.category.name,
            style: TextStyle(color: secondaryTextColor),
          ),
          style: textTheme.bodyText2,
        ),
        SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryTextColor,
          ),
          width: 5,
          height: 5,
        ),
        SizedBox(width: 8),
        Text.rich(
          TextSpan(
            text: problem.difficultyString(),
            style: TextStyle(color: _difficultyColor(), letterSpacing: 0.3),
          ),
          style: textTheme.bodyText2,
        ),
      ],
    );
  }

  Color _difficultyColor() {
    switch (problem.difficulty) {
      case Difficulty.difficult:
        return accentColor;
      case Difficulty.solutionFound:
        return primaryColor;
      case Difficulty.solved:
        return secondaryTextColor;
    }
    return secondaryTextColor;
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                problem.authorImageUrl,
                width: 32,
                height: 32,
              ),
            ),
            SizedBox(width: 8),
            Text(
              problem.author,
              style: textTheme.headline3,
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                width: 18,
                height: 18,
              ),
            ),
            SizedBox(width: 8),
            Text(
              problem.likeCount.toString(),
              style: textTheme.headline3,
            )
          ],
        ),
      ],
    );
  }

  Widget _description() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(S.current.Description, style: textTheme.headline2),
        SizedBox(height: 8),
        Text(
          problem.description,
          style: textTheme.bodyText2.copyWith(height: 5 / 3),
        ),
      ],
    );
  }

  Widget _necessaryResources() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(S.current.NecessaryResources, style: textTheme.headline2),
        SizedBox(height: 16),
        ...problem.necessaryResources
            .asMap()
            .map(
              (int index, String resource) => MapEntry(
                index,
                Container(
                  margin: EdgeInsets.only(
                    bottom:
                        index == problem.necessaryResources.length - 1 ? 0 : 16,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: greenSubtleColor,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          size: 12,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        resource,
                        style: textTheme.bodyText2.copyWith(
                          color: mainTextColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ],
    );
  }

  Widget _solutionSteps() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(S.current.SolutionSteps, style: textTheme.headline2),
        SizedBox(height: 18),
        ...problem.solutionSteps
            .asMap()
            .map(
              (int index, String resource) => MapEntry(
                index,
                Container(
                  margin: EdgeInsets.only(
                    bottom:
                        index == problem.necessaryResources.length - 1 ? 0 : 16,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: mainTextColor,
                        ),
                        child: Text(
                          (index + 1).toString(),
                          style: textTheme.subtitle1.copyWith(
                            color: backgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              resource,
                              style: textTheme.bodyText2.copyWith(
                                color: mainTextColor,
                                height: 5 / 3,
                              ),
                              softWrap: true,
                            ),
                            SizedBox(width: 13),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: AspectRatio(
                                aspectRatio: 2 / 1,
                                child: Image.asset(
                                  problem.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ],
    );
  }
}
