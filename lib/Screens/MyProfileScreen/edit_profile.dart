import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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
            "My Profile",
            style: TextStyle(color: whiteColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text(
                "First Name",
                style: TextStyle(
                    fontSize: 16,
                    color: greyColor),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(),
              ),
              const SizedBox(height: 25),
              const Text(
                "Last Name",
                style: TextStyle(
                    fontSize: 16,
                    color: greyColor),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(),
              ),
              const SizedBox(height: 25),
              const Text(
                "Email",
                style: TextStyle(
                    fontSize: 16,
                    color: greyColor),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(),
              ),
              const SizedBox(height: 25),
              const Text(
                "Mobile Number",
                style: TextStyle(
                    fontSize: 16,
                    color: greyColor),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(),
              ),
              const SizedBox(height: 25),
              const Text(
                "Gender",
                style: TextStyle(
                    fontSize: 16,
                    color: greyColor),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(),
              ),
              const Spacer(),
              Container(
                height: 40,
                color: buttonColor,
                alignment: Alignment.center,
                child: const Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 16,
                      color: whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
