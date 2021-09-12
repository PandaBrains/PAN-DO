import 'package:pan_do/core/base/model/base_model.dart';

class EditTaskModel with BaseModel {
  int? id;
  String? title;
  String? detail;

  EditTaskModel({this.id, this.title, this.detail});

  EditTaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['detail'] = this.detail;
    return data;
  }
}
