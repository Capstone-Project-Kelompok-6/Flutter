import 'package:json_annotation/json_annotation.dart';

part 'summary_offline_rows.g.dart';

@JsonSerializable()
class SummaryOfflineRows {
  SummaryOfflineRows({
    required this.bookId,
    required this.userId,
    required this.email,
    required this.fullname,
    required this.classId,
    required this.workout,
    required this.workoutImage,
    required this.instructorName,
    required this.classDates,
    required this.price,
    required this.description,
    required this.createdAt,
    required this.endClassDate,
  });

  @JsonKey(name: 'book_id')
  String bookId;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'full_name')
  String fullname;

  @JsonKey(name: 'class_id')
  String classId;

  @JsonKey(name: 'workout')
  String workout;

  @JsonKey(name: 'workout_image')
  String workoutImage;

  @JsonKey(name: 'instructor_name')
  String instructorName;

  @JsonKey(name: 'class_dates', defaultValue: [])
  List<String> classDates;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'created_at')
  int createdAt;

  @JsonKey(name: 'end_class_date')
  int endClassDate;

  factory SummaryOfflineRows.fromJson(Map<String, dynamic> json) =>
      _$SummaryOfflineRowsFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryOfflineRowsToJson(this);
}
