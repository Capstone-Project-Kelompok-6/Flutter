import 'package:json_annotation/json_annotation.dart';

part 'article_rows.g.dart';

@JsonSerializable()
class ArticleRows {
  ArticleRows({
    required this.articleId,
    required this.title,
    required this.description,
    required this.imageName,
    required this.articleImage,
    this.updatedAt,
  });

  @JsonKey(name: 'article_id')
  String articleId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'image_name')
  String imageName;

  @JsonKey(name: 'article_image')
  String articleImage;

  @JsonKey(name: 'updated_at')
  int? updatedAt;

  factory ArticleRows.fromJson(Map<String, dynamic> json) =>
      _$ArticleRowsFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleRowsToJson(this);
}
