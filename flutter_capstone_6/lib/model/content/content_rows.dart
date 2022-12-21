import 'package:json_annotation/json_annotation.dart';

part 'content_rows.g.dart';

@JsonSerializable()
class ContentRows {
  ContentRows({
    required this.videoContentId,
    required this.title,
    required this.videoName,
    required this.video,
    required this.thumbnail,
    required this.thumbnailName,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'video_content_id')
  String videoContentId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'thumbnail')
  String thumbnail;

  @JsonKey(name: 'thumbnail_name')
  String thumbnailName;

  @JsonKey(name: 'video_name')
  String videoName;

  @JsonKey(name: 'video')
  String video;

  @JsonKey(name: 'created_at')
  int? createdAt;

  @JsonKey(name: 'updated_at')
  int? updatedAt;

  factory ContentRows.fromJson(Map<String, dynamic> json) =>
      _$ContentRowsFromJson(json);
  Map<String, dynamic> toJson() => _$ContentRowsToJson(this);
}
