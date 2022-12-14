import 'package:flutter_capstone_6/model/class_online/class_online_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'class_online_outer.g.dart';

@JsonSerializable()
class ClassOnlineOuter {
  ClassOnlineOuter({
    required this.data,
  });

  @JsonKey(name: 'data')
  ClassOnlineData data;

  factory ClassOnlineOuter.fromJson(Map<String, dynamic> json) =>
      _$ClassOnlineOuterFromJson(json);
  Map<String, dynamic> toJson() => _$ClassOnlineOuterToJson(this);
}
