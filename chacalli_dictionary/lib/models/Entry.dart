import 'package:hive_flutter/hive_flutter.dart';

part 'Entry.g.dart';

@HiveType(typeId: 0)
class Entry {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? word;

  @HiveField(2)
  String? meaning;

  @HiveField(3)
  String? pronunciation;

  Entry({
    required this.id,
    required this.word,
    required this.meaning,
    required this.pronunciation
  });

  //DEBUG: Need override toString?
  /*@override
  String toString() =>
    "";*/
}