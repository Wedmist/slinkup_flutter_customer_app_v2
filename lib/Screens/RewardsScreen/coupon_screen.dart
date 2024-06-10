import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/RewardsScreen/GalleryScreens/gallery_screen.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:flutter_customer_app/Utils/constants.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons
                    .arrow_back_ios_rounded)),
            title: const Text("Cart"),
          ),
          body: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20),
                  height: 40,
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText:
                            "Enter Coupon Code",
                        suffixIcon: Padding(
                          padding:
                              EdgeInsets.only(
                                  top: 8),
                          child: Text(
                            "Apply",
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 14,
                                fontWeight:
                                    FontWeight
                                        .w500),
                          ),
                        )),
                  )),
              const SizedBox(height: 15),
              const Divider(
                  height: 2, color: greyColor),
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                    left: 30),
                color: greyLightColor,
                child: const Text(
                  "Available Coupons",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.w500),
                ),
              ),
              const Divider(
                  height: 2, color: greyColor),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: const EdgeInsets.only(
                      top: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GalleryScreen(),
                            ));
                      },
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .start,
                        children: [
                          const SizedBox(
                              height: 10),
                          Padding(
                            padding:
                                const EdgeInsets
                                        .only(
                                    left: 10),
                            child: Image.asset(
                              Images.wedmistCoup,
                              scale: 2.2,
                            ),
                          ),
                          const SizedBox(
                              height: 10),
                          const Padding(
                            padding:
                                EdgeInsets.only(
                                    left: 10),
                            child: Text(
                              "Get 20% OFF up to ₹100",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight
                                          .w500),
                            ),
                          ),
                          const SizedBox(
                              height: 10),
                          Row(
                            children: const [
                              SizedBox(width: 10),
                              Text(
                                "Valid on total value of items worth ₹499 or more.",
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        greyColor),
                              ),
                              Spacer(),
                              Text(
                                "View Details",
                                style: TextStyle(
                                    color:
                                        blueColor,
                                    fontSize: 14,
                                    fontWeight:
                                        FontWeight
                                            .w400),
                              ),
                              SizedBox(width: 10)
                            ],
                          ),
                          const SizedBox(
                              height: 10),
                          const Divider(
                            height: 3,
                            indent: 10,
                            endIndent: 10,
                            color: greyColor,
                          ),
                          const SizedBox(
                              height: 10),
                          Row(
                            children: [
                              Stack(
                                alignment:
                                    Alignment
                                        .center,
                                children: [
                                  Image.asset(
                                    Images
                                        .couponName,
                                    scale: 3.2,
                                  ),
                                  const Text(
                                    "FIRSTGO",
                                    style: TextStyle(
                                        color:
                                            blueColor,
                                        fontSize:
                                            18,
                                        fontWeight:
                                            FontWeight
                                                .w500),
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Text(
                                "Apply",
                                style: TextStyle(
                                    color:
                                        greenColor,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                  width: 15),
                            ],
                          ),
                          const SizedBox(
                              height: 10),
                          const Divider(
                            height: 2,
                            endIndent: 10,
                            indent: 10,
                            color: greyColor,
                          ),
                          const SizedBox(
                              height: 10),
                          const Padding(
                            padding:
                                EdgeInsets.only(
                                    left: 10),
                            child: Text(
                              "Save ₹100 on this Coupon",
                              style: TextStyle(
                                  color:
                                      blueColor,
                                  fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                              height: 10),
                          Container(
                              height: 10,
                              color:
                                  lightBackGroundColor)
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
