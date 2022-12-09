import 'dart:convert';

import 'package:flutter/widgets.dart';

class DataModel {
  int? limit;
  int? page;
  String? sort;
  int? total_rows;
  int? total_pages;
  int? size;
  List<RowsModel>? rows;

  DataModel(
      {this.limit,
      this.page,
      this.sort,
      this.total_rows,
      this.total_pages,
      this.size,
      this.rows});

  DataModel.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    sort = json['sort'];
    total_rows = json['total_rows'];
    total_pages = json['total_pages'];
    size = json['size'];
    rows = (json['rows'] as List<dynamic>)
        .map((e) => RowsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

class RowsModel {
  String? class_id;
  String? workout;
  String? video_title;
  String? video_name;
  String? video;
  int? price;
  String? description;
  int? updated_at;
  int? created_at;

  RowsModel(
      {this.class_id,
      this.workout,
      this.video_title,
      this.video_name,
      this.video,
      this.price,
      this.description,
      this.updated_at,
      this.created_at});

  RowsModel.fromJson(Map<String, dynamic> json) {
    class_id = json['class_id'];
    workout = json['workout'];
    video_title = json['video_title'];
    video_name = json['video_name'];
    video = json['video'];
    price = json['price'];
    description = json['description'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }
}

class AllModel {
  DataModel? data;
  String? message;

  AllModel({this.data, this.message});

  AllModel.fromJson(Map<String, dynamic> json) {
    data = DataModel.fromJson(json['data']);
    message = json['message'];
  }
}
