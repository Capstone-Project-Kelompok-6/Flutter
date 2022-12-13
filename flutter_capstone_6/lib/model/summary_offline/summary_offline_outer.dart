import 'package:flutter_capstone_6/model/summary_offline/summary_offline_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_offline_outer.g.dart';

@JsonSerializable()
class SummaryOfflineOuter {
  SummaryOfflineOuter({
    this.data,
  });

  @JsonKey(name: 'data')
  SummaryOfflineData? data;

  factory SummaryOfflineOuter.fromJson(Map<String, dynamic> json) =>
      _$SummaryOfflineOuterFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryOfflineOuterToJson(this);
}
