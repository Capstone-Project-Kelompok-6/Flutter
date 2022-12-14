import 'package:flutter_capstone_6/model/summary_offline/summary_offline_rows.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_offline_data.g.dart';

@JsonSerializable()
class SummaryOfflineData {
  SummaryOfflineData({
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
  List<SummaryOfflineRows>? rows;

  factory SummaryOfflineData.fromJson(Map<String, dynamic> json) =>
      _$SummaryOfflineDataFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryOfflineDataToJson(this);
}
