import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Screens/Reviews/customer_reviews_screen.dart';
import 'package:flutter_customer_app/Utils/Images.dart';

import '../../Utils/constants.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height;
    double width =
        MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: whiteColor,
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
              "Reviews",
              style: TextStyle(color: whiteColor),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 8, right: 8),
                  child: Card(
                    child: SizedBox(
                      height: height / 2.5,
                      width: width,
                      child: Padding(
                        padding:
                            const EdgeInsets.all(
                                10.0),
                        child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .start,
                            children: [
                              const TitleString(
                                  title:
                                      "Rate Raveena Majid",
                                  fontSize: 15),
                              const SizedBox(
                                  height: 5),
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                        color:
                                            greyColor,
                                        image: DecorationImage(
                                            image: AssetImage(Images
                                                .house),
                                            fit: BoxFit
                                                .fill),
                                        shape: BoxShape
                                            .circle),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons
                                                .star,
                                            color:
                                                yellowColor,
                                          ),
                                          Icon(
                                            Icons
                                                .star,
                                            color:
                                                yellowColor,
                                          ),
                                          Icon(
                                            Icons
                                                .star,
                                            color:
                                                yellowColor,
                                          ),
                                          Icon(
                                            Icons
                                                .star,
                                            color:
                                                yellowColor,
                                          ),
                                          Icon(
                                            Icons
                                                .star,
                                            color:
                                                yellowColor,
                                          ),
                                          SizedBox(
                                              width:
                                                  5),
                                          Text(
                                            "(4.7)",
                                            style: TextStyle(
                                                color: blackColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          )
                                        ],
                                      ),
                                      const Icon(
                                        Icons
                                            .star,
                                        color:
                                            yellowColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  height: 10),
                              const Text(
                                "Rate how satisfied your are with Raveena Majid",
                                style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        greyColor),
                              ),
                              const SizedBox(
                                  height: 10),
                              const TitleString(
                                  title:
                                      "Write Your Review",
                                  fontSize: 15),
                              const Card(
                                child: TextField(
                                  maxLines: 4,
                                  decoration:
                                      InputDecoration(
                                          hintText:
                                              "Write your review about Service delivered to you"),
                                ),
                              ),
                              MaterialButton(
                                  color:
                                      blueColor,
                                  onPressed:
                                      () {},
                                  child:
                                      const Padding(
                                    padding:
                                        EdgeInsets
                                            .all(
                                                4.0),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          color:
                                              whiteColor),
                                    ),
                                  ))
                            ]),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 5, left: 8),
                  child: SizedBox(
                    height: 60,
                    child: TitleString(
                        title:
                            "See What Customers says about our Service",
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                    height: height / 2.6,
                    width: width,
                    child:
                        const CustomerReviewsScreen(
                      physics:
                          BouncingScrollPhysics(),
                    ))
              ],
            ),
          )),
    );
  }
}
