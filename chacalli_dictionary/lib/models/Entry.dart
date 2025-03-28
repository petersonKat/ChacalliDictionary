import 'package:json_annotation/json_annotation.dart';

part 'Entry.g.dart';

@JsonSerializable()
class Entry {
  Entry({required this.id,
    required this.word,
    required this.meaning,
    required this.pronunciation});

  final int id;
  @JsonKey(name: 'chacalli_word')
  final String word;
  @JsonKey(name: 'common_meaning')
  final String meaning;
  final String pronunciation;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}