// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_online_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassOnlineRows _$ClassOnlineRowsFromJson(Map<String, dynamic> json) {
  return ClassOnlineRows(
    classId: json['class_id'] as String,
    workout: json['workout'] as String,
    videoTitle: json['video_title'] as String,
    videoName: json['video_name'] as String,
    video: json['video'] as String,
    thumbnailName: json['thumbnail_name'] as String,
    thumbnail: json['thumbnail'] as String,
    price: json['price'] as int,
    description: json['description'] as String,
    updatedAt: json['updated_at'] as int?,
    createdAt: json['created_at'] as int?,
  );
}

Map<String, dynamic> _$ClassOnlineRowsToJson(ClassOnlineRows instance) =>
    <String, dynamic>{
      'class_id': instance.classId,
      'workout': instance.workout,
      'video_title': instance.videoTitle,
      'video_name': instance.videoName,
      'video': instance.video,
      'thumbnail_name': instance.thumbnailName,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
      'description': instance.description,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };
