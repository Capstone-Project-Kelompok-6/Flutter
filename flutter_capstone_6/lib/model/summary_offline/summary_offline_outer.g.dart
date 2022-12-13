// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_offline_outer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryOfflineOuter _$SummaryOfflineOuterFromJson(Map<String, dynamic> json) {
  return SummaryOfflineOuter(
    data: json['data'] == null
        ? null
        : SummaryOfflineData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SummaryOfflineOuterToJson(
        SummaryOfflineOuter instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
