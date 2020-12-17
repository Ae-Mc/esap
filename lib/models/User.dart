import 'package:flutter/material.dart';

class User {
  String name;
  String surname;
  String imageAsset;
  int id;

  String _nickname;

  /// If not set, equals to "$[name] $[surname]"
  String get nickname => ((_nickname == null) ? "$name $surname" : _nickname);

  set nickname(String newValue) => _nickname = newValue;

  /// If nickname is not set, nickname sets to [name] + ' ' + [surname]
  User({
    @required this.name,
    @required this.surname,
    @required this.id,
    String nickname,
    this.imageAsset,
  }) : this._nickname = nickname;
}
