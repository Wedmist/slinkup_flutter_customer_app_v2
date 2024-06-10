import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Utils/Images.dart';

import '../../../Utils/constants.dart';

class MyBookingProfileScreen extends StatelessWidget {
  const MyBookingProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: lightBackGroundColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            title: const Text("My Bookings"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage(Images.networkImage), fit: BoxFit.fill)),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                const Text(
                                  "Mrs. Raveena Majid",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  children: const [
                                    Icon(Icons.star, color: yellowColor, size: 18),
                                    Icon(Icons.star, color: yellowColor, size: 18),
                                    Icon(Icons.star, color: yellowColor, size: 18),
                                    Icon(Icons.star, color: yellowColor, size: 18),
                                    Icon(Icons.star, color: yellowColor, size: 18),
                                    Text(
                                      "(4.7)",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Service",
                                  style: TextStyle(color: greyColor),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "1.Basic Party Makeup for Family",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Estimated Price",
                                  style: TextStyle(color: greyColor),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '₹3000',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        const Text(
                          "Booking Details",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        bookDetails(
                          icon: const Icon(
                            Icons.location_on,
                            color: greenColor,
                            size: 20,
                          ),
                          titleText: 'Service Location',
                          subTitle: "Panchasakha nagar. plot no, 14/3, near ITER College, Bhubaneswar, Odisha 751019",
                        ),
                        const SizedBox(height: 10),
                        bookDetails(
                            icon: const Icon(
                              Icons.access_time,
                              color: blueColor,
                              size: 20,
                            ),
                            titleText: "Timing",
                            subTitle: "Wed, 27 Sept 2021, 10 am"),
                        const SizedBox(height: 10),
                        bookDetails(
                            icon: Image.asset(IconsView.serviceStatusIcon, scale: 3),
                            titleText: "Service Status",
                            subTitle: "Not yet Started"),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 100,
                              decoration:
                                  BoxDecoration(color: lightBackGroundColor, borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: const Text(
                                "Reschedule",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 45,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: blackColor, borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "Support",
                                style: TextStyle(fontSize: 14, color: whiteColor, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          height: 100,
                                          child: Column(
                                            children: [
                                              const Text("You can download invoice once your service is completed"),
                                              const Spacer(),
                                              Container(
                                                  height: 35,
                                                  color: blueColor,
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    "ok",
                                                    style: TextStyle(color: whiteColor),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: 45,
                                width: 100,
                                alignment: Alignment.center,
                                decoration:
                                    BoxDecoration(color: lightBackGroundColor, borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  "Cancel Order",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                      leading: Image.asset(Images.downloadInvoiceTag, scale: 5),
                      title: const Text("Download Invoice"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Payment Details",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [Text("Service Total"), SizedBox(height: 5), Text("Convinience Charge")],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "₹3,000",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "₹49",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                )
                              ],
                            ))
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(
                          height: 1,
                          color: greyColor,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                                child: Text(
                              "Total Amount",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            )),
                            Expanded(
                                child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "₹3,049",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget bookDetails({
    required Widget icon,
    required String titleText,
    required String subTitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 8),
        SizedBox(
          width: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 11),
              )
            ],
          ),
        )
      ],
    );
  }
}
