import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: whiteColor,
            )),
        title: const Text(
          "About Us",
          style: TextStyle(color: whiteColor),
        ),
      ),
    ));
  }
}
