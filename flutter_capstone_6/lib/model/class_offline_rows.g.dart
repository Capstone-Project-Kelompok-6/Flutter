// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_offline_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassOfflineRows _$ClassOfflineRowsFromJson(Map<String, dynamic> json) {
  return ClassOfflineRows(
    classId: json['class_id'] as String,
    workoutId: json['workout_id'] as String,
    workout: json['workout'] as String,
    workoutImage: json['workout_image'] as String,
    instructorId: json['instructor_id'] as String,
    instructorName: json['instructor_name'] as String,
    instructorImage: json['instructor_image'] as String,
    classDates:
        (json['class_dates'] as List<dynamic>).map((e) => e as String).toList(),
    price: json['price'] as int,
    description: json['description'] as String,
    updatedAt: json['updated_at'] as int?,
    createdAt: json['created_at'] as int?,
  );
}

Map<String, dynamic> _$ClassOfflineRowsToJson(ClassOfflineRows instance) =>
    <String, dynamic>{
      'class_id': instance.classId,
      'workout_id': instance.workoutId,
      'workout': instance.workout,
      'workout_image': instance.workoutImage,
      'instructor_id': instance.instructorId,
      'instructor_name': instance.instructorName,
      'instructor_image': instance.instructorImage,
      'class_dates': instance.classDates,
      'price': instance.price,
      'description': instance.description,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };
