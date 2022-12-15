// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_online_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryOnlineRows _$SummaryOnlineRowsFromJson(Map<String, dynamic> json) {
  return SummaryOnlineRows(
    bookId: json['book_id'] as String,
    userId: json['user_id'] as String,
    email: json['email'] as String,
    fullname: json['full_name'] as String,
    workout: json['workout'] as String,
    video: json['video'] as String,
    videoName: json['video_name'] as String,
    videoTitle: json['video_title'] as String,
    thumbnailName: json['thumbnail_name'] as String,
    thumbnail: json['thumbnail'] as String,
    price: json['price'] as int,
    description: json['description'] as String,
    createdAt: json['created_at'] as int?,
  );
}

Map<String, dynamic> _$SummaryOnlineRowsToJson(SummaryOnlineRows instance) =>
    <String, dynamic>{
      'book_id': instance.bookId,
      'user_id': instance.userId,
      'email': instance.email,
      'full_name': instance.fullname,
      'workout': instance.workout,
      'video': instance.video,
      'video_name': instance.videoName,
      'video_title': instance.videoTitle,
      'thumbnail_name': instance.thumbnailName,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
      'description': instance.description,
      'created_at': instance.createdAt,
    };
