import 'package:esap/models/Problem.dart';
import 'package:esap/widgets/ProblemCard.dart';
import 'package:flutter/cupertino.dart';

class ProblemList extends StatelessWidget {
  final List<Problem> problems;

  ProblemList(this.problems);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            spacing: 25,
            runSpacing: 32,
            children: problems
                .map((problem) => ProblemCard(problem))
                .toList(),
          ),
        ),
      ),
    );
  }
}