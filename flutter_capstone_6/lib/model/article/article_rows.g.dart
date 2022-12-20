// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleRows _$ArticleRowsFromJson(Map<String, dynamic> json) {
  return ArticleRows(
    articleId: json['article_id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    imageName: json['image_name'] as String,
    articleImage: json['article_image'] as String,
    updatedAt: json['updated_at'] as int?,
  );
}

Map<String, dynamic> _$ArticleRowsToJson(ArticleRows instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'title': instance.title,
      'description': instance.description,
      'image_name': instance.imageName,
      'article_image': instance.articleImage,
      'updated_at': instance.updatedAt,
    };
