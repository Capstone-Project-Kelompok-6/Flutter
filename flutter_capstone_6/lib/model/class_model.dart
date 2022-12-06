import 'dart:convert';

class ClassModel {
  Data? data;
  String? message;

  ClassModel({this.data, this.message});

  ClassModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? limit;
  int? page;
  String? sort;
  int? totalRows;
  int? totalPages;
  int? size;
  List<Rows>? rows;

  Data(
      {this.limit,
      this.page,
      this.sort,
      this.totalRows,
      this.totalPages,
      this.size,
      this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    sort = json['sort'];
    totalRows = json['total_rows'];
    totalPages = json['total_pages'];
    size = json['size'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['page'] = this.page;
    data['sort'] = this.sort;
    data['total_rows'] = this.totalRows;
    data['total_pages'] = this.totalPages;
    data['size'] = this.size;
    if (this.rows != null) {
      data['rows'] = this.rows!.toList();
    }
    return data;
  }
}

class Rows {
  String? classId;
  String? workout;
  String? videoTitle;
  String? videoName;
  String? video;
  int? price;
  String? description;
  int? updatedAt;
  int? createdAt;

  Rows(
      {this.classId,
      this.workout,
      this.videoTitle,
      this.videoName,
      this.video,
      this.price,
      this.description,
      this.updatedAt,
      this.createdAt});

  Rows.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    workout = json['workout'];
    videoTitle = json['video_title'];
    videoName = json['video_name'];
    video = json['video'];
    price = json['price'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_id'] = this.classId;
    data['workout'] = this.workout;
    data['video_title'] = this.videoTitle;
    data['video_name'] = this.videoName;
    data['video'] = this.video;
    data['price'] = this.price;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
