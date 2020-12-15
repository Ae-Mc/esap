import 'dart:ui';

import 'package:esap/main.dart';
import 'package:esap/models/Problem.dart';
import 'package:esap/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProblemCard extends StatelessWidget {
  static const String _noImageAsset = "assets/icons/Image.svg";
  final Problem problem;

  ProblemCard(this.problem);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 151,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _author(context),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              ProblemRoute,
              arguments: {"problem": problem},
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _image(),
                SizedBox(height: 16),
                Text(problem.name,
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(height: 8),
                _bottomContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _author(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProfileRoute,
        arguments: {
          "name": problem.author,
          "imageAsset": problem.authorImageUrl
        },
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: problem.authorImageUrl == null
                ? SvgPicture.asset(
                    _noImageAsset,
                    width: 31,
                    height: 31,
                    fit: BoxFit.fill,
                    color: Color(0xFF9FA5C0),
                  )
                : Image.asset(
                    problem.authorImageUrl,
                    width: 31,
                    height: 31,
                    fit: BoxFit.fill,
                  ),
          ),
          SizedBox(width: 8),
          Text(
            problem.author,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(letterSpacing: 0.4),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          problem.imageUrl == null
              ? SvgPicture.asset(
                  _noImageAsset,
                  width: 151,
                  height: 151,
                  fit: BoxFit.fill,
                  color: Color(0xFF9FA5C0),
                )
              : Image.asset(
                  problem.imageUrl,
                  width: 151,
                  height: 151,
                  fit: BoxFit.cover,
                ),
          Positioned(
            top: 16,
            right: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: SvgPicture.asset(
                    "assets/icons/HeartBorder.svg",
                    color: Colors.white,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomContent(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: problem.category.name,
            style: TextStyle(color: secondaryTextColor),
          ),
          style: Theme.of(context).textTheme.subtitle1,
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
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }

  Color _difficultyColor() {
    switch (problem.difficulty) {
      case Difficulty.difficult:
        return accentColor;
      case Difficulty.solutionFound:
        return Color(0xFF2F80ED);
      case Difficulty.solved:
        return secondaryTextColor;
    }
    return secondaryTextColor;
  }
}
