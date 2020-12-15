import 'package:esap/generated/l10n.dart';
import 'package:esap/models/Category.dart';

enum Difficulty { difficult, solutionFound, solved }

class Problem {
  final String name;
  final String author;
  final String description;
  final Difficulty difficulty;
  final Category category;
  final List<String> necessaryResources;
  final String imageUrl;
  final String authorImageUrl;
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
    this.authorImageUrl,
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

  static List<Problem> allProblems() {
    return [
      Problem(
        "Ямы на выезде",
        "Даниил Сучков",
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.difficult,
        Category.allCategories()[2],
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_01.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
        authorImageUrl: "assets/images/author_01.jpg",
      ),
      Problem(
        "Мой двор",
        "Александр Крафт",
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        Category.allCategories()[1],
        ["Асфальт", "Площадка", "Краска"],
        imageUrl: "assets/images/card_02.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
        authorImageUrl: "assets/images/author_02.jpg",
        likeCount: 273,
      ),
      Problem(
        "Маршрут 21",
        "Елена Канская",
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        Category.allCategories()[1],
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_03.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
        authorImageUrl: "assets/images/author_03.jpg",
      ),
      Problem(
        "Вокзал",
        "Евгений Местный",
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        Category.allCategories()[1],
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_04.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
        authorImageUrl: "assets/images/author_04.jpg",
      ),
      Problem(
        "Мой двор",
        "Даниил Сучков",
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        Category.allCategories()[1],
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_05.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
        authorImageUrl: "assets/images/author_01.jpg",
      ),
      Problem(
        "Мой двор",
        "Даниил Сучков",
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        Category.allCategories()[1],
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_06.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
        authorImageUrl: "assets/images/author_01.jpg",
      ),
    ];
  }
}
