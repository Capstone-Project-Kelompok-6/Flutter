// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_online_outer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryOnlineOuter _$SummaryOnlineOuterFromJson(Map<String, dynamic> json) {
  return SummaryOnlineOuter(
    data: json['data'] == null
        ? null
        : SummaryOnlineData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SummaryOnlineOuterToJson(SummaryOnlineOuter instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
