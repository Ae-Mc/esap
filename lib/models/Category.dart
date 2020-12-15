import 'package:esap/generated/l10n.dart';

class Category {
  final String name;
  final int id;

  Category(this.name, this.id);

  static List<Category> allCategories() {
    return [
      Category(S.current.All, 0),
      Category(S.current.Courtyards, 1),
      Category(S.current.Roads, 2),
    ];
  }
}
