// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_outer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentOuter _$ContentOuterFromJson(Map<String, dynamic> json) {
  return ContentOuter(
    data: json['data'] == null
        ? null
        : ContentData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContentOuterToJson(ContentOuter instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
