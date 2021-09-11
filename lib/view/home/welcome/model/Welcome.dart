import 'package:pan_do/view/home/welcome/model/ToDo.dart';

class WelcomeModel {
  String? username;
  String? status;
  List<ToDoModel>? response = [];

  WelcomeModel({this.username, this.status, this.response});

  WelcomeModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    status = json['status'];
    if (json['response'] != null) {
      json['response'].forEach((v) {
        response!.add(new ToDoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
