// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/SplashScreen/otp_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Apis/api_constants.dart';
import '../../Apis/api_helper.dart';
import '../../Utils/Images.dart';
import '../../Utils/constants.dart';
import '../SignUp_LoginScreen/signup_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  final String? name;
  const PhoneNumberScreen({Key? key, this.name}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController mbCtrl = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool isValid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 360,
                  width: width,
                  child: Stack(
                    children: [
                      Image.asset(
                        Images.phoneNumberImg,
                        fit: BoxFit.fill,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Image.asset(
                              Images.slinkupImg,
                              scale: 30,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Log in",
                        style: TextStyle(fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " or",
                        style: TextStyle(fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " Sign up",
                        style: TextStyle(fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: isValid
                      ? Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1)),
                          ),
                          child: Row(
                            children: [
                              Image.asset(Images.indianFlag, scale: 4),
                              const SizedBox(width: 10),
                              const Text(
                                "+91",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 2),
                              Icon(Icons.arrow_drop_down),
                              const SizedBox(width: 8),
                              Container(height: 20, width: 1, color: Colors.black),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                    controller: mbCtrl,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none, hintText: "Enter your Mobile Numbers"),
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value?.length != 10) {
                                        return 'Mobile Number must be of 10 digit';
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: Row(
                            children: [
                              const Icon(Icons.mail),
                              const SizedBox(width: 8),
                              Container(height: 20, width: 1, color: Colors.black),
                              const SizedBox(width: 8),
                              Expanded(
                                // height: 45,
                                child: TextFormField(
                                    controller: mbCtrl,
                                    decoration: InputDecoration(
                                        hintText: isValid ? "Enter your Mobile Numbers" : "Enter your valid Email ID"),
                                    keyboardType: isValid ? TextInputType.phone : TextInputType.emailAddress,
                                    validator: (value) {
                                      if (isValid == true) {
                                        if (value?.length != 10) {
                                          return 'Mobile Number must be of 10 digit';
                                        } else {
                                          return null;
                                        }
                                      } else {
                                        var pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex = RegExp(pattern);
                                        if (!regex.hasMatch(value!))
                                          return 'Enter Valid Email';
                                        else
                                          return null;
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      isValid = !isValid;
                      mbCtrl.text = "";
                      setState(() {});
                    },
                    child: Text(
                      isValid ? "Use Email ID" : "Use Mobile Number",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: blueColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                      color: GetDarkBlueColor,
                      minWidth: width,
                      onPressed: () async {
                        if (formGlobalKey.currentState!.validate()) {
                          Map<String, dynamic> params = isValid
                              ? {"mobile_no": mbCtrl.text, "method": "mobile_no", "flag": "customer"}
                              : {"email_id": mbCtrl.text, "method": "email_id", "flag": "customer"};

                          var userReg = await ApiHelpers().getuserPostData(apiUserExists, params);
                          if (userReg!['status'] == 200) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OtpScreen(isValid: isValid, otp: userReg['otp'], mbNumber: mbCtrl.text),
                                ));
                          } else if (userReg['status'] == 400 || userReg['error'] == "user does not exist") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(
                                    isValid: isValid,
                                    commonValue: mbCtrl.text.toString(),
                                  ),
                                ));
                          } else if (userReg['message'] != null) {
                            Fluttertoast.showToast(
                                msg: userReg['message'] ?? "User Already Registered",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please Check Number",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        }
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: whiteColor),
                      )),
                ),
                const SizedBox(height: 10),

                // const Text(
                //     "Or connect with social media"),
                // const SizedBox(height: 10),
                // Padding(
                //   padding:
                //       const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: blueColor,
                //         borderRadius:
                //             BorderRadius.circular(
                //     child: Row(
                //                 10)),
                //       mainAxisAlignment:
                //           MainAxisAlignment
                //               .center,
                //       children: [
                //         Image.asset(
                //             IconsView.googleIcon),
                //         const SizedBox(width: 10),
                //         const Text(
                //           "Continue with Google",
                //           style: TextStyle(
                //               color: whiteColor,
                //               fontSize: 16),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding:
                //       const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: 50,
                //     decoration: BoxDecoration(
                //         color: blueColor,
                //         borderRadius:
                //             BorderRadius.circular(
                //                 10)),
                //     child: Row(
                //       mainAxisAlignment:
                //           MainAxisAlignment
                //               .center,
                //       children: [
                //         Image.asset(IconsView
                //             .facebookIcon),
                //         const SizedBox(width: 10),
                //         const Text(
                //           "Continue with Facebook",
                //           style: TextStyle(
                //               color: whiteColor,
                //               fontSize: 16),
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
