// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) {
  return ArticleData(
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    sort: json['sort'] as String?,
    totalRows: json['total_rows'] as int?,
    totalPages: json['total_pages'] as int?,
    size: json['size'] as int?,
    rows: (json['rows'] as List<dynamic>?)
        ?.map((e) => ArticleRows.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArticleDataToJson(ArticleData instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sort': instance.sort,
      'total_rows': instance.totalRows,
      'total_pages': instance.totalPages,
      'size': instance.size,
      'rows': instance.rows,
    };
