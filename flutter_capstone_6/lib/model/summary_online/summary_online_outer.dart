import 'package:flutter_capstone_6/model/summary_online/summary_online_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_online_outer.g.dart';

@JsonSerializable()
class SummaryOnlineOuter {
  SummaryOnlineOuter({
    this.data,
  });

  @JsonKey(name: 'data')
  SummaryOnlineData? data;

  factory SummaryOnlineOuter.fromJson(Map<String, dynamic> json) =>
      _$SummaryOnlineOuterFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryOnlineOuterToJson(this);
}
