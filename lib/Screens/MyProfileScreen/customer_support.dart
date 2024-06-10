import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Utils/Images.dart';

import '../../Utils/constants.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              left: 10, top: 12, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: blueColor,
                      )),
                  const Spacer(),
                  const Text(
                    "Need Help?",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: 15,
                        fontWeight:
                            FontWeight.w500),
                  ),
                  const SizedBox(width: 50),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 10),
              Image.asset(Images.helpCenterImg,
                  scale: 4),
              const SizedBox(height: 10),
              Image.asset(
                  Images.customerSupportImg,
                  scale: 3),
              const SizedBox(height: 10),
              const Text(
                "Tell us how we can help you",
                style: TextStyle(
                    color: buttonColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                  "Our Customer Support team is standing by for \n service & Support"),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      Images
                          .callcustomerSupprotImg,
                      scale: 5,
                    ),
                    title: const Text(
                      'Call Customer Support',
                      style: TextStyle(
                          color: buttonColor,
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: const [
                        Text(
                            "Call our Support Team to solve your query"),
                        Text(
                          "+91 7008227795",
                          style: TextStyle(
                              color: blueColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      Images.emailImg,
                      scale: 5,
                    ),
                    title: const Text(
                      'Email',
                      style: TextStyle(
                          color: buttonColor,
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: const [
                        Text(
                            "Email us for any query"),
                        Text(
                          "+91 7008227795",
                          style: TextStyle(
                              color: blueColor),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
