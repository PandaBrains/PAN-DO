import 'package:pan_do/core/base/model/base_model.dart';

class ToDoModel with BaseModel {
  int? id;
  int? userId;
  String? title;
  String? detail;
  int? state;
  String? createdAt;
  String? updatedAt;

  ToDoModel(
      {this.id,
      this.userId,
      this.title,
      this.detail,
      this.state,
      this.createdAt,
      this.updatedAt});

  ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    detail = json['detail'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
