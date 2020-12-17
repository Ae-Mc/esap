library uuid;

import 'package:esap/generated/l10n.dart';
import 'package:esap/models/User.dart';
import 'package:esap/models/Category.dart';
import 'package:esap/models/Problem.dart';

class DataState {
  List<User> authors;
  List<Problem> problems;
  Set<Category> categories;

  DataState() {
    categories = _getCategories();
    authors = _getAuthors();
    problems = _getProblems();
  }

  User getAuthorById(int id) {
    return authors.firstWhere((User author) => author.id == id);
  }

  User getAuthorByNickname(String nickname) {
    return authors.firstWhere((User author) => author.nickname == nickname,
        orElse: null);
  }

  List<User> _getAuthors() {
    return [
      User(
        name: "Даниил",
        surname: "Сучков",
        id: 0,
      ),
      User(
        name: "Александр",
        surname: "Крафт",
        id: 1,
        imageAsset: "assets/images/author_02.jpg",
      ),
      User(
        name: "Елена",
        surname: "Канская",
        id: 2,
        imageAsset: "assets/images/author_03.jpg",
      ),
      User(
        name: "Евгений",
        surname: "Местный",
        id: 3,
        imageAsset: "assets/images/author_04.jpg",
      ),
    ];
  }

  List<Problem> _getProblems() {
    return [
      Problem(
        "Ямы на выезде",
        getAuthorById(0),
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.difficult,
        categories.elementAt(2),
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_01.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
      ),
      Problem(
        "Мой двор",
        getAuthorById(1),
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        categories.elementAt(1),
        ["Асфальт", "Площадка", "Краска"],
        imageUrl: "assets/images/card_02.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
        likeCount: 273,
      ),
      Problem(
        "Маршрут 21",
        getAuthorById(2),
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        categories.elementAt(0),
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_03.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
      ),
      Problem(
        "Вокзал",
        getAuthorById(3),
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        categories.elementAt(1),
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_04.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
      ),
      Problem(
        "Мой двор",
        getAuthorById(0),
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        categories.elementAt(2),
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_05.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
      ),
      Problem(
        "Мой двор",
        getAuthorById(1),
        "В моеём дворе ужасная дорога, да ещё и машины паркуются рядом с детской площадкой. Я нашёл решение.",
        Difficulty.solutionFound,
        categories.elementAt(0),
        ["Асфальт", "Краска", "Площадка"],
        imageUrl: "assets/images/card_06.jpg",
        solutionSteps: [
          "Первым делом, предлагаю разграничить территорию парковки и детской площадки путём совещания и принятия решения на общедомовом собрании."
        ],
      ),
    ];
  }

  Set<Category> _getCategories() {
    return Set.from([
      Category(S.current.All, 0),
      Category(S.current.Courtyards, 1),
      Category(S.current.Roads, 2),
    ]);
  }
}
