import 'package:json_annotation/json_annotation.dart';

part 'summary_online_rows.g.dart';

@JsonSerializable()
class SummaryOnlineRows {
  SummaryOnlineRows({
    required this.bookId,
    required this.userId,
    required this.email,
    required this.fullname,
    required this.workout,
    required this.video,
    required this.videoName,
    required this.videoTitle,
    required this.thumbnailName,
    required this.thumbnail,
    required this.price,
    required this.description,
    this.createdAt,
  });

  @JsonKey(name: 'book_id')
  String bookId;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'full_name')
  String fullname;

  @JsonKey(name: 'workout')
  String workout;

  @JsonKey(name: 'video')
  String video;

  @JsonKey(name: 'video_name')
  String videoName;

  @JsonKey(name: 'video_title')
  String videoTitle;

  @JsonKey(name: 'thumbnail_name')
  String thumbnailName;

  @JsonKey(name: 'thumbnail')
  String thumbnail;

  @JsonKey(name: 'price')
  int price;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'created_at')
  int? createdAt;

  factory SummaryOnlineRows.fromJson(Map<String, dynamic> json) =>
      _$SummaryOnlineRowsFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryOnlineRowsToJson(this);
}
