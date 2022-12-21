// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentRows _$ContentRowsFromJson(Map<String, dynamic> json) {
  return ContentRows(
    videoContentId: json['video_content_id'] as String,
    title: json['title'] as String,
    videoName: json['video_name'] as String,
    video: json['video'] as String,
    createdAt: json['created_at'] as int?,
    updatedAt: json['updated_at'] as int?,
  );
}

Map<String, dynamic> _$ContentRowsToJson(ContentRows instance) =>
    <String, dynamic>{
      'video_content_id': instance.videoContentId,
      'title': instance.title,
      'video_name': instance.videoName,
      'video': instance.video,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
