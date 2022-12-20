import 'package:flutter_capstone_6/model/article/article_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_outer.g.dart';

@JsonSerializable()
class ArticleOuter {
  ArticleOuter({
    this.data,
  });

  @JsonKey(name: 'data')
  ArticleData? data;

  factory ArticleOuter.fromJson(Map<String, dynamic> json) =>
      _$ArticleOuterFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleOuterToJson(this);
}
