// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';

class MyImageView extends StatelessWidget {
  String imgPath;

  MyImageView(this.imgPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: FittedBox(
      fit: BoxFit.fill,
      child: Image.asset(imgPath),
    ));
  }
}

class TitleString extends StatelessWidget {
  final String title;
  final double fontSize;
  const TitleString(
      {Key? key,
      required this.title,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          fontFamily: "Roboto"),
    );
  }
}
