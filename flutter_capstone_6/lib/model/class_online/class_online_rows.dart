import 'package:json_annotation/json_annotation.dart';

part 'class_online_rows.g.dart';

@JsonSerializable()
class ClassOnlineRows {
  ClassOnlineRows({
    required this.classId,
    required this.workout,
    required this.videoTitle,
    required this.videoName,
    required this.video,
    required this.price,
    required this.description,
    this.updatedAt,
    this.createdAt,
  });

  @JsonKey(name: 'class_id')
  String classId;

  @JsonKey(name: 'workout')
  String workout;

  // @JsonKey(name: 'workout_image')
  // String workoutImage;

  @JsonKey(name: 'video_title')
  String videoTitle;

  @JsonKey(name: 'video_name')
  String videoName;

  @JsonKey(name: 'video')
  String video;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'updated_at')
  int? updatedAt;

  @JsonKey(name: 'created_at')
  int? createdAt;

  factory ClassOnlineRows.fromJson(Map<String, dynamic> json) =>
      _$ClassOnlineRowsFromJson(json);
  Map<String, dynamic> toJson() => _$ClassOnlineRowsToJson(this);
}
