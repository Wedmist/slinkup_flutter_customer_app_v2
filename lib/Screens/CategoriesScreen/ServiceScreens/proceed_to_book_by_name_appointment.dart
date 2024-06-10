import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/booking_confirmed.dart';
import 'package:flutter_customer_app/Utils/Images.dart';

import '../../../Utils/constants.dart';
import '../Components/cancellation_policy_tile.dart';

class ProceedToBookByNameAppontment
    extends StatefulWidget {
  const ProceedToBookByNameAppontment({Key? key})
      : super(key: key);

  @override
  State<ProceedToBookByNameAppontment>
      createState() =>
          _ProceedToBookByNameAppontmentState();
}

class _ProceedToBookByNameAppontmentState
    extends State<ProceedToBookByNameAppontment> {
  @override
  Widget build(BuildContext context) {
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
          title: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                            Images.networkImage),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Makeup By Marina",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Laxmi Nagar, Bhubaneswar",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(Images
                                .networkImage),
                            fit: BoxFit.fill)),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Ms. Marina Mathur",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.w500),
                        ),
                        const Text("Beauty Expert"),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              8)),
                              alignment:
                                  Alignment.center,
                              child: const Text(
                                "4.7 *",
                                style: TextStyle(
                                    color:
                                        whiteColor,
                                    fontWeight:
                                        FontWeight
                                            .w500),
                              ),
                            ),
                            const SizedBox(
                                width: 25),
                            Image.asset(
                              Images.arrowRightImg,
                              scale: 4,
                            ),
                            const SizedBox(
                                width: 10),
                            const Text(
                                "49 Customer Served")
                          ],
                        )
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 10),
            Container(
                height: 8,
                color: lightBackGroundColor),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(Images.house,
                          scale: 3),
                      const SizedBox(width: 5),
                      const Text("Appointment Time")
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Today, 11:30 AM",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                      "Makeup By Marina, Laxmi Nagar Bhubaneswar"),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            Container(
                height: 8,
                color: lightBackGroundColor),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(
                        top: 5),
                    child: Image.asset(
                        Images.coupon,
                        scale: 2.5),
                  ),
                  title: const Text(
                      "Apply Coupon Code"),
                  subtitle: const Text(
                      "Free Booking on your First Order"),
                  trailing: const Text(
                    "Apply",
                    style: TextStyle(
                        color: blueColor,
                        fontWeight:
                            FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
                height: 8,
                color: lightBackGroundColor),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bill Details",
                    style: TextStyle(
                        fontWeight:
                            FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: const [
                          Text(
                              "Service Provider’s Fee"),
                          SizedBox(height: 5),
                          Text(
                              "Booking/Convenience Fee"),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [
                          const Text(
                              "To be calculated"),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .end,
                            children: const [
                              Text(
                                "₹50",
                                style: TextStyle(
                                    color:
                                        greyColor),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "FREE",
                                style: TextStyle(
                                    color:
                                        greenColor),
                              )
                            ],
                          ),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                      height: 1, color: greyColor),
                  const SizedBox(height: 10),
                  const Text(
                    "Final Payable amount will generate after the Service",
                    style: TextStyle(
                        fontWeight:
                            FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
                height: 8,
                color: lightBackGroundColor),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CancellationPolicyTile(
                  backGroundColor:
                      lightBackGroundColor),
            ),
            const SizedBox(height: 10),
            const Divider(
                height: 2, color: greyColor),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BookingConfirmed(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius:
                          BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Book your Appointment",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: whiteColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
