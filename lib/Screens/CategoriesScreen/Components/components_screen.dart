import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final String imageText;
  final String imageView;
  const CategoryComponent({Key? key, required this.imageText, required this.imageView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        //Padding(padding: EdgeInsets.only(left: 20.0)),
        SizedBox(
          height: 60,
          child: Image.asset(
            imageView,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          imageText,
          style: const TextStyle(fontSize: 14, fontFamily: "Roboto"),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
