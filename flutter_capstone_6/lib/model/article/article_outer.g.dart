// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_outer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleOuter _$ArticleOuterFromJson(Map<String, dynamic> json) {
  return ArticleOuter(
    data: json['data'] == null
        ? null
        : ArticleData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArticleOuterToJson(ArticleOuter instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
