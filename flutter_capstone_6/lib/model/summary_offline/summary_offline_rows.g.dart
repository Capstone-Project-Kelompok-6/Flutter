// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_offline_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryOfflineRows _$SummaryOfflineRowsFromJson(Map<String, dynamic> json) {
  return SummaryOfflineRows(
    bookId: json['book_id'] as String,
    userId: json['user_id'] as String,
    email: json['email'] as String,
    fullname: json['full_name'] as String,
    classId: json['class_id'] as String,
    workout: json['workout'] as String,
    workoutImage: json['workout_image'] as String,
    instructorName: json['instructor_name'] as String,
    classDates: (json['class_dates'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    price: json['price'] as int,
    description: json['description'] as String,
    createdAt: json['created_at'] as int,
    endClassDate: json['end_class_date'] as int,
  );
}

Map<String, dynamic> _$SummaryOfflineRowsToJson(SummaryOfflineRows instance) =>
    <String, dynamic>{
      'book_id': instance.bookId,
      'user_id': instance.userId,
      'email': instance.email,
      'full_name': instance.fullname,
      'class_id': instance.classId,
      'workout': instance.workout,
      'workout_image': instance.workoutImage,
      'instructor_name': instance.instructorName,
      'class_dates': instance.classDates,
      'price': instance.price,
      'description': instance.description,
      'created_at': instance.createdAt,
      'end_class_date': instance.endClassDate,
    };
