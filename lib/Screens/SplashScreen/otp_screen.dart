// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/dash_board_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Apis/api_constants.dart';
import '../../Apis/api_helper.dart';
import '../../Utils/constants.dart';
import '../SignUp_LoginScreen/mobile_verif_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.mbNumber, required this.otp, required this.isValid}) : super(key: key);
  final String mbNumber;
  final String otp;
  final bool isValid;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;
  final int time = 30;
  late AnimationController _controller;
  bool _hideResendButton = false;
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
        title: const Text(
          'Verify Details',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: formGlobalKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('OTP sent to your mobile number', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 15),
              Row(
                children: [
                  widget.isValid
                      ? Text(
                          "+91-${widget.mbNumber}",
                          style: const TextStyle(fontSize: 16),
                        )
                      : Text(
                          widget.mbNumber,
                          style: const TextStyle(fontSize: 16),
                        ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Edit"))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // Implement 4 input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(_fieldOne, true), // auto focus
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _hideResendButton
                  ? TextButton(
                      onPressed: () async {
                        Map<String, dynamic> params = {
                          "mobile_no": widget.mbNumber,
                          "method": "mobile_no",
                          "flag": "customer"
                        };

                        var userReg = await ApiHelpers().getuserPostData(apiUserExists, params);
                        _controller = AnimationController(vsync: this, duration: Duration(seconds: time))
                          ..addStatusListener((status) {
                            if (status == AnimationStatus.dismissed) {
                              setState(() {
                                _hideResendButton = !_hideResendButton;
                              });
                            }
                          });
                        _controller.reverse(from: _controller.value == 0.0 ? 1.0 : _controller.value);
                      },
                      child: const Text("Resend OTP"))
                  : Row(
                      children: [
                        const Text("Expires in "),
                        OtpTimer(_controller, 15.0, Colors.black),
                      ],
                    ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: blueColor,
                    minWidth: wt,
                    onPressed: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        Map<String, dynamic> params = widget.isValid
                            ? {"mobile_no": widget.mbNumber, "otp": widget.otp, "flag": "customer"}
                            : {"email_id": widget.mbNumber, "otp": widget.otp, "flag": "customer"};
                        var userReg = await ApiHelpers().getuserPostData(apiVerifyOtp, params);
                        if (userReg!['status'] == 200) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardScreen(),
                              ));
                        } else if (userReg['message'] != null) {
                          Fluttertoast.showToast(
                              msg: userReg['message'] != null ? userReg['message'] : "User Already Registered",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Check Number",
                              toastLength: Toast.LENGTH_LONG,
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
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: Card(
        child: TextFormField(
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          validator: (value) {
            if (value?.length != 1)
              return 'Mobile Number must be of 1 digit';
            else
              return null;
          },
          maxLength: 1,
          cursorColor: Theme.of(context).primaryColor,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), counterText: '', hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
