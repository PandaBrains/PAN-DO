import 'package:flutter/material.dart';

import 'package:pan_do/core/components/button/custom_button.dart';
import 'package:pan_do/core/components/column/form_column.dart';
import 'package:pan_do/core/components/container/custom_title_container.dart';
import 'package:pan_do/core/components/input/custom_form.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/view/home/edittask/model/EditTask.dart';
import 'package:pan_do/view/home/edittask/viewmodel/edit_task_view_model.dart';

class EditTaskView extends StatelessWidget {
  late EditTaskModel args;
  final _viewModel = EditTaskViewModel();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _taskTitleController;
  late TextEditingController _taskDetailController;

  @override
  Widget build(BuildContext context) {
    _viewModel.init();
    args = ModalRoute.of(context)?.settings.arguments as EditTaskModel;
    _taskTitleController = TextEditingController(text: args.title);
    _taskDetailController = TextEditingController(text: args.detail);
    return Scaffold(
      body: buildApp(context),
    );
  }

  Column buildApp(BuildContext context) {
    return Column(
      children: [
        CustomTitleContainer(
          widget: CustomText(data: 'Görevi Düzenle'),
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
                buttonName: 'Görevi Güncelle',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _viewModel.updateTask(
                      EditTaskModel(
                          id: args.id,
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
