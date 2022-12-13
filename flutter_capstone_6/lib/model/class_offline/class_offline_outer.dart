import 'package:flutter_capstone_6/model/class_offline/class_offline_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'class_offline_outer.g.dart';

@JsonSerializable()
class ClassOfflineOuter {
  ClassOfflineOuter({
    required this.data,
  });

  @JsonKey(name: 'data')
  ClassOfflineData data;

  factory ClassOfflineOuter.fromJson(Map<String, dynamic> json) =>
      _$ClassOfflineOuterFromJson(json);
  Map<String, dynamic> toJson() => _$ClassOfflineOuterToJson(this);
}
