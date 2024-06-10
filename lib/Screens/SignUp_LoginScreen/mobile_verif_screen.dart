// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/dash_board_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Apis/api_constants.dart';
import '../../Apis/api_helper.dart';
import '../../Utils/constants.dart';

class MobileVerifyScreen extends StatefulWidget {
  const MobileVerifyScreen({
    Key? key,
    required this.mbNumber,
    required this.otp,
  }) : super(key: key);
  final String mbNumber;
  final int otp;
  @override
  State<MobileVerifyScreen> createState() => _MobileVerifyScreenState();
}

class _MobileVerifyScreenState extends State<MobileVerifyScreen> with TickerProviderStateMixin {
  final int time = 30;
  late AnimationController _controller;
  bool _hideResendButton = false;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool passwordVisible = false;
  final formGlobalKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: time))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          setState(() {
            _hideResendButton = !_hideResendButton;
          });
        }
      });
    _controller.reverse(from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const SizedBox(height: 15),
                  const Text(
                    "Mobile Verification",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Please Enter OTP sent to",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                      width: wt - 50,
                      height: 50,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                        color: lightblueColor,
                      ),
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          const Text("Mobile"),
                          const Spacer(),
                          Text(
                            "+91-${widget.mbNumber}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                        ],
                      )),
                  const SizedBox(height: 15),
                  const SizedBox(height: 8),
                  Container(
                    width: wt - 50,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: lightblueColor,
                    ),
                    // padding:
                    //     const EdgeInsets.only(
                    //         left: 5, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // maxLength: 4,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          suffixIcon: _hideResendButton
                              ? TextButton(
                                  onPressed: () async {
                                    Map<String, dynamic> resendOtpParams = {
                                      "mobile_no": widget.mbNumber,
                                      "flag": "customer",
                                      "method": "mobile_no"
                                    };
                                    var userSendOtpReg =
                                        await ApiHelpers().getuserPostData(apiSendOtp, resendOtpParams);
                                    debugPrint(userSendOtpReg.toString());
                                  },
                                  child: const Text("Resend OTP"))
                              : const SizedBox(),
                          border: InputBorder.none,
                          hintText: 'OTP'),
                      onChanged: (value) {
                        // user.username = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  _hideResendButton
                      ? const SizedBox()
                      : Row(
                          children: [
                            const Text("Expires in "),
                            OtpTimer(_controller, 15.0, Colors.black),
                          ],
                        ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        color: GetlightblueColor,
                        minWidth: wt,
                        onPressed: () async {
                          if (formGlobalKey.currentState!.validate()) {
                            Map<String, dynamic> params = {
                              "mobile_no": widget.mbNumber,
                              "otp": widget.otp,
                              "flag": "customer"
                            };
                            var userReg = await ApiHelpers().getuserPostData(apiVerifyOtp, params);
                            if (userReg != null) {
                              if (userReg['status'] == 200) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DashboardScreen(),
                                    ));
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpTimer extends StatelessWidget {
  final AnimationController controller;
  double fontSize;
  Color timeColor = Colors.black;

  OtpTimer(this.controller, this.fontSize, this.timeColor);

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    if (duration.inHours > 0) {
      return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Duration get duration {
    Duration duration = controller.duration ?? Duration(seconds: 30);
    return duration;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Text(
            "${timerString}s",
            style: TextStyle(color: timeColor, fontWeight: FontWeight.w600),
          );
        });
  }
}
