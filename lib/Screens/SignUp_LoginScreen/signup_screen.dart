// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/SignUp_LoginScreen/mobile_verif_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Apis/api_constants.dart';
import '../../Apis/api_helper.dart';
import '../../Utils/constants.dart';
import '../../Utils/enums.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key, required this.commonValue, required this.isValid}) : super(key: key);
  final String commonValue;
  final bool isValid;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController commonCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  // TextEditingController mbCtrl =
  //     TextEditingController();
  bool passwordVisible = false;
  final formGlobalKey = GlobalKey<FormState>();
  SignUpGenderEnum genderEnum = SignUpGenderEnum.male;
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //   color: lightblueColor,
                  //   height: 100,
                  //   width: wt,
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Image.asset(
                  //       ImagesView
                  //           .getMeBusinessDark,
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Welcome to SlinkUp",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    widget.isValid
                        ? "Mobile Number: +91-${widget.commonValue}"
                        : " Your email ID: ${widget.commonValue}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  widget.isValid
                      ? const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 8),
                          child: Text(
                            "OTP will be sent to this number for verification",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 18),
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: wt - 50,
                    child: TextFormField(
                      controller: nameCtrl,
                      validator: (value) {
                        if (value!.length < 3)
                          return 'Name must be more than 2 charater';
                        else
                          return null;
                      },
                      decoration: const InputDecoration(hintText: "Please Enter Your Name"),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // const Text(
                  //   "Mobile Number",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //   ),
                  // ),
                  // const SizedBox(height: 8),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(
                  //           left: 8, right: 8),
                  //   child: Row(
                  //     children: [
                  //       // SizedBox(width: 10),
                  //       const Text(
                  //         "+91",
                  //         style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight:
                  //                 FontWeight
                  //                     .bold),
                  //       ),
                  //       const SizedBox(width: 5),
                  //       Expanded(
                  //         child: TextFormField(
                  //           controller: mbCtrl,
                  //           keyboardType:
                  //               TextInputType
                  //                   .phone,
                  //           validator: (value) {
                  //             if (value!.length !=
                  //                 10)
                  //               return 'Mobile Number must be of 10 digit';
                  //             else
                  //               return null;
                  //           },
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //     ],
                  //   ),
                  // ),

                  // const SizedBox(height: 15),
                  !widget.isValid
                      ? const Text(
                          "Mobile Number",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      : const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: wt - 50,
                    child: !widget.isValid
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  // SizedBox(width: 10),
                                  const Text(
                                    "+91",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(height: 20, width: 1, color: Colors.black),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextFormField(
                                      controller: commonCtrl,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.length != 10)
                                          return 'Mobile Number must be of 10 digit';
                                        else
                                          return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ],
                          )
                        : TextFormField(
                            controller: commonCtrl,
                            decoration: const InputDecoration(hintText: "Please Enter Your Email"),
                            validator: (value) {
                              var pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value!))
                                return 'Enter Valid Email';
                              else
                                return null;
                            },
                            keyboardType: TextInputType.name,
                          ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: wt - 50,
                    child: TextFormField(
                      controller: passwordCtrl,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hintText: "Please Enter Password"),
                      validator: (value) {
                        if (value!.length < 3)
                          return 'Password must be more than 2 charater';
                        else
                          return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Gender",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: wt,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            genderEnum = SignUpGenderEnum.male;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 38,
                            width: wt / 3.8,
                            decoration: BoxDecoration(
                                color: genderEnum == SignUpGenderEnum.male
                                    ? GetDarkBlueColor
                                    : Color.fromRGBO(75, 110, 232, 0.1),
                                border: Border.all(width: 2, color: GetDarkBlueColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Male",
                              style: TextStyle(
                                  color: genderEnum == SignUpGenderEnum.male ? whiteColor : GetDarkBlueColor,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            genderEnum = SignUpGenderEnum.female;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 38,
                            width: wt / 3.8,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2, color: GetDarkBlueColor),
                                color: genderEnum == SignUpGenderEnum.female
                                    ? GetDarkBlueColor
                                    : Color.fromRGBO(75, 110, 232, 0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Female",
                              style: TextStyle(
                                  color: genderEnum == SignUpGenderEnum.female ? whiteColor : GetDarkBlueColor,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            genderEnum = SignUpGenderEnum.others;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 38,
                            width: wt / 3.8,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2, color: GetDarkBlueColor),
                                color: genderEnum == SignUpGenderEnum.others
                                    ? GetDarkBlueColor
                                    : Color.fromRGBO(75, 110, 232, 0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Others",
                              style: TextStyle(
                                  color: genderEnum == SignUpGenderEnum.others ? whiteColor : GetDarkBlueColor,
                                  fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16, color: blackColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'By continuing you agree to our ',
                        ),
                        TextSpan(text: 'Terms of Service', style: TextStyle(color: GetlightblueColor, fontSize: 16)),
                        TextSpan(
                          text: ' and',
                          style: TextStyle(color: blackColor, fontSize: 16),
                        ),
                        TextSpan(text: ' Privacy Policy', style: TextStyle(color: GetlightblueColor, fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        color: GetDarkBlueColor,
                        minWidth: wt,
                        onPressed: () async {
                          if (formGlobalKey.currentState!.validate()) {
                            Map<String, dynamic> encyPd = {"password": passwordCtrl.text.toString()};
                            var getEncryptPw = await ApiHelpers().getuserPostData(apiEncryptPassword, encyPd);
                            String encryptPassword = getEncryptPw!["data"];

                            // String?
                            //     encryptPassword =
                            //     await EncryptData()
                            //         .encryptAES(
                            //             passwordCtrl
                            //                 .text);

                            Map<String, dynamic> params = {
                              // "name":
                              //     nameCtrl.text,
                              // // "mobile_no":
                              // //     mbCtrl.text,
                              // "email":
                              //     commonCtrl.text,
                              // "password":
                              //     encryptPassword,
                              // "role": "user",
                              // "flag": "provider",
                              // "gender": genderEnum
                              //     .name
                              //     .toString(),
                              // {
                              "name": nameCtrl.text,
                              "mobile_no": widget.isValid ? widget.commonValue : commonCtrl.text,
                              "email": !widget.isValid ? widget.commonValue : commonCtrl.text,
                              "gender": "Male",
                              "password": encryptPassword,
                              "role": "user",
                              "flag": "customer"
// }
                            };
                            var userReg = await ApiHelpers().getuserPostData(apiUserRegistration, params);
                            if (userReg != null) {
                              if (userReg['status'] == 200) {
                                Map<String, dynamic> resendOtpParams = {
                                  "mobile_no": widget.isValid ? widget.commonValue : commonCtrl.text,
                                  "flag": "customer",
                                  "method": "mobile_no"
                                };
                                var userSendOtpReg = await ApiHelpers().getuserPostData(apiSendOtp, resendOtpParams);
                                if (userSendOtpReg!['status'] == 200) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MobileVerifyScreen(
                                            otp: userSendOtpReg['otp'],
                                            mbNumber: widget.isValid ? widget.commonValue : commonCtrl.text),
                                      ));
                                }
                              } else if (userReg['message'] != null) {
                                Fluttertoast.showToast(
                                    msg: userReg['message'] ?? "User Already Registered",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "User Already Registered",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
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
                  // const SizedBox(height: 15),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: RichText(
                  //       text: TextSpan(
                  //           style: const TextStyle(
                  //               fontSize: 16,
                  //               color:
                  //                   blackColor),
                  //           children: <TextSpan>[
                  //         const TextSpan(
                  //           text:
                  //               'Already have an account?  ',
                  //         ),
                  //         TextSpan(
                  //             text: 'Log In',
                  //             style: const TextStyle(
                  //                 color:
                  //                     blueColor,
                  //                 fontWeight:
                  //                     FontWeight
                  //                         .bold),
                  //             recognizer:
                  //                 TapGestureRecognizer()
                  //                   ..onTap = () {
                  //                     Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               const LoginScreen(),
                  //                         ));
                  //                   }),
                  //       ])),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
