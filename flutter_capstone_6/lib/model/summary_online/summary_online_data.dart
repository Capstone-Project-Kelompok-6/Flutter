import 'package:flutter_capstone_6/model/summary_online/summary_online_rows.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_online_data.g.dart';

@JsonSerializable()
class SummaryOnlineData {
  SummaryOnlineData({
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
  List<SummaryOnlineRows>? rows;

  factory SummaryOnlineData.fromJson(Map<String, dynamic> json) =>
      _$SummaryOnlineDataFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryOnlineDataToJson(this);
}
