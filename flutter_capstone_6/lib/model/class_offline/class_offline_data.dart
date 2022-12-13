import 'package:flutter_capstone_6/model/class_offline/class_offline_rows.dart';
import 'package:json_annotation/json_annotation.dart';

part 'class_offline_data.g.dart';

@JsonSerializable()
class ClassOfflineData {
  ClassOfflineData({
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
  List<ClassOfflineRows>? rows;

  factory ClassOfflineData.fromJson(Map<String, dynamic> json) =>
      _$ClassOfflineDataFromJson(json);
  Map<String, dynamic> toJson() => _$ClassOfflineDataToJson(this);
}
