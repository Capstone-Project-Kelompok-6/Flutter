import 'package:flutter_capstone_6/model/class_online/class_online_rows.dart';
import 'package:json_annotation/json_annotation.dart';

part 'class_online_data.g.dart';

@JsonSerializable()
class ClassOnlineData {
  ClassOnlineData({
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
  List<ClassOnlineRows>? rows;

  factory ClassOnlineData.fromJson(Map<String, dynamic> json) =>
      _$ClassOnlineDataFromJson(json);
  Map<String, dynamic> toJson() => _$ClassOnlineDataToJson(this);
}
