// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hintText;

  const CommonTextFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.textInputAction,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      
      
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
        ),
      ),
    );
  }
}
