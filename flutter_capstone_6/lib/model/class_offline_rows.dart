import 'package:json_annotation/json_annotation.dart';

part 'class_offline_rows.g.dart';

@JsonSerializable()
class ClassOfflineRows {
  ClassOfflineRows({
    this.classId,
    this.workoutId,
    this.workout,
    this.workoutImage,
    this.instructorId,
    this.instructorName,
    this.instructorImage,
    this.classDates,
    this.price,
    this.description,
    this.updatedAt,
    this.createdAt,
  });

  @JsonKey(name: 'class_id')
  String? classId;

  @JsonKey(name: 'workout_id')
  String? workoutId;

  @JsonKey(name: 'workout')
  String? workout;

  @JsonKey(name: 'workout_image')
  String? workoutImage;

  @JsonKey(name: 'instructor_id')
  String? instructorId;

  @JsonKey(name: 'instructor_name')
  String? instructorName;

  @JsonKey(name: 'instructor_image')
  String? instructorImage;

  @JsonKey(name: 'class_dates')
  List<String>? classDates;

  @JsonKey(name: 'price')
  int? price;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'updated_at')
  int? updatedAt;

  @JsonKey(name: 'created_at')
  int? createdAt;

  factory ClassOfflineRows.fromJson(Map<String, dynamic> json) =>
      _$ClassOfflineRowsFromJson(json);
  Map<String, dynamic> toJson() => _$ClassOfflineRowsToJson(this);
}
