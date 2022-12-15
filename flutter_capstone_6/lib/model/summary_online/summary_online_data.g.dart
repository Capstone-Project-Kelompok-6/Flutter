// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_online_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryOnlineData _$SummaryOnlineDataFromJson(Map<String, dynamic> json) {
  return SummaryOnlineData(
    limit: json['limit'] as int?,
    page: json['page'] as int?,
    sort: json['sort'] as String?,
    totalRows: json['total_rows'] as int?,
    totalPages: json['total_pages'] as int?,
    size: json['size'] as int?,
    rows: (json['rows'] as List<dynamic>?)
        ?.map((e) => SummaryOnlineRows.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SummaryOnlineDataToJson(SummaryOnlineData instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'sort': instance.sort,
      'total_rows': instance.totalRows,
      'total_pages': instance.totalPages,
      'size': instance.size,
      'rows': instance.rows,
    };
