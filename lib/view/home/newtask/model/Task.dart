import 'package:pan_do/core/base/model/base_model.dart';

class TaskModel with BaseModel {
  String? title;
  String? detail;

  TaskModel({this.title, this.detail});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['detail'] = this.detail;
    return data;
  }
}
