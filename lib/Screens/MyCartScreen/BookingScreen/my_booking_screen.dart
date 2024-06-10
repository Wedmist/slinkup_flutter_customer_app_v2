import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/MyCartScreen/BookingScreen/my_booking_profile_screen.dart';

import '../../../Utils/Images.dart';
import '../../../Utils/constants.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightBackGroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: const Text("My Bookings"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: width / 1.6,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: greyColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: const [
                        Icon(Icons.search_rounded, color: greyColor),
                        SizedBox(width: 5),
                        Text(
                          "Search all your bookings",
                          style: TextStyle(color: GetLightGreyColor),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      Images.fullFilter,
                      scale: 4.5,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Divider(height: 2, color: greyColor),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyBookingProfileScreen(),
                          ));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "AC Repairing & Servicing",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Wed, 27 Sept 2021, 10 am",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Booked",
                                      style: TextStyle(fontSize: 14, color: greenColor, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          Images.callViewImage,
                                          scale: 3.5,
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          Images.messageViewImg,
                                          scale: 3.5,
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          Images.getOtpImg,
                                          scale: 3.5,
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          Images.trackImg,
                                          scale: 3.5,
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: const [Icon(Icons.arrow_forward_ios_rounded, color: blueColor)],
                                    ))
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
