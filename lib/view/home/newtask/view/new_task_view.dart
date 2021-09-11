import 'package:flutter/material.dart';
import 'package:pan_do/core/components/button/custom_button.dart';
import 'package:pan_do/core/components/column/form_column.dart';
import 'package:pan_do/core/components/container/custom_title_container.dart';
import 'package:pan_do/core/components/input/custom_form.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/view/home/newtask/model/Task.dart';
import 'package:pan_do/view/home/newtask/viewmodel/new_task_view_model.dart';

class NewTaskView extends StatelessWidget {
  final _viewModel = NewTaskViewModel();
  final _formKey = GlobalKey<FormState>();
  final _taskTitleController = TextEditingController();
  final _taskDetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _viewModel.init();
    return buildApp(context);
  }

  Column buildApp(BuildContext context) {
    return Column(
      children: [
        CustomTitleContainer(
          widget: CustomText(data: 'Yeni Görev'),
          height: 160,
        ),
        Container(
          child: FormColumn(
            formKey: _formKey,
            children: [
              CustomTextForm(
                controller: _taskTitleController,
                title: 'Görev Başlığı',
                hintText: 'Görev Başlık',
                validator: (value) =>
                    value!.isEmpty ? 'Görev için bir başlık girin.' : null,
              ),
              CustomTextForm(
                controller: _taskDetailController,
                title: 'Görev Açıklaması',
                hintText: 'Görev Açıklaması',
                validator: (value) =>
                    value!.isEmpty ? 'Görev için bir açıklama girin.' : null,
              ),
              CustomButton(
                buttonName: 'Görevi Ekle',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _viewModel.createTask(
                      TaskModel(
                          title: _taskTitleController.text,
                          detail: _taskDetailController.text),
                      context,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
