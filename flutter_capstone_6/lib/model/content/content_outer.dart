import 'package:flutter_capstone_6/model/article/article_data.dart';
import 'package:flutter_capstone_6/model/content/content_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_outer.g.dart';

@JsonSerializable()
class ContentOuter {
  ContentOuter({
    this.data,
  });

  @JsonKey(name: 'data')
  ContentData? data;

  factory ContentOuter.fromJson(Map<String, dynamic> json) =>
      _$ContentOuterFromJson(json);
  Map<String, dynamic> toJson() => _$ContentOuterToJson(this);
}
