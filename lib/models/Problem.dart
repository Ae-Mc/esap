import 'package:esap/generated/l10n.dart';
import 'package:esap/models/User.dart';
import 'package:esap/models/Category.dart';

enum Difficulty { difficult, solutionFound, solved }

class Problem {
  final String name;
  final User author;
  final String description;
  final Difficulty difficulty;
  final Category category;
  final List<String> necessaryResources;
  final String imageUrl;
  final List<String> solutionSteps;
  final int likeCount;

  Problem(
    this.name,
    this.author,
    this.description,
    this.difficulty,
    this.category,
    this.necessaryResources, {
    this.imageUrl,
    this.solutionSteps,
    this.likeCount = 0,
  });

  String difficultyString() {
    switch (difficulty) {
      case Difficulty.difficult:
        return S.current.Difficult;
      case Difficulty.solutionFound:
        return S.current.SolutionExists;
      case Difficulty.solved:
        return S.current.Solved;
    }
    return S.current.Unknown;
  }
}
