// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      id: (json['id'] as num).toInt(),
      word: json['chacalli_word'] as String,
      meaning: json['common_meaning'] as String,
      pronunciation: json['pronunciation'] as String,
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'id': instance.id,
      'chacalli_word': instance.word,
      'common_meaning': instance.meaning,
      'pronunciation': instance.pronunciation,
    };
