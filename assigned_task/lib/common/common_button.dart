// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback voidCallback;
  final String title;
  const CommonButton({
    Key? key,
    required this.voidCallback,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Text(title,style: TextStyle(color: Colors.white),),
        )),
    );
  }
}
