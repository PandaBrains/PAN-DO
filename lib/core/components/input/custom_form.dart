import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class CustomForm extends StatefulWidget {
  final String title;
  final String hintText;
  final bool isPassword;
  final TextInputType? type;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;

  const CustomForm({
    Key? key,
    required this.title,
    required this.hintText,
    this.type,
    this.isPassword = false,
    required this.validator,
    required this.onSaved
  }) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late String _title;
  late String _hintText;
  late bool _isPassword;
  late TextInputType? _type;
  late FormFieldValidator<String> _validator;
  late FormFieldSetter<String> _onSaved;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _hintText = widget.hintText;
    _isPassword = widget.isPassword;
    _type = widget.type;
    _validator = widget.validator;
    _onSaved = widget.onSaved;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: PaddingInsets.instance!.formPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            data: _title,
            color: ColorSchemeLight.instance!.darkGrey,
            fontSize: 16,
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            cursorColor: Colors.black,
            keyboardType: _type,
            obscureText: _isPassword ? true : false,
            onSaved: _onSaved,
            validator: _validator,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                fillColor: ColorSchemeLight.instance!.alternativeGrey,
                filled: true,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                hintText: _hintText),
          )
        ],
      ),
    );
  }
}
