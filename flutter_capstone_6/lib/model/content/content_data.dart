import 'package:flutter_capstone_6/model/content/content_rows.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_data.g.dart';

@JsonSerializable()
class ContentData {
  ContentData({
    this.limit,
    this.page,
    this.sort,
    this.totalRows,
    this.totalPages,
    this.size,
    this.rows,
  });

  @JsonKey(name: 'limit')
  int? limit;

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'sort')
  String? sort;

  @JsonKey(name: 'total_rows')
  int? totalRows;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'size')
  int? size;

  @JsonKey(name: 'rows')
  List<ContentRows>? rows;

  factory ContentData.fromJson(Map<String, dynamic> json) =>
      _$ContentDataFromJson(json);
  Map<String, dynamic> toJson() => _$ContentDataToJson(this);
}
