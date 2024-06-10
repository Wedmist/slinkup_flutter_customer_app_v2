import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/proceed_to_book_appointment_screen.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';

import '../../../Utils/Images.dart';
import '../../../Utils/constants.dart';

class BookAnAppointMentScreen
    extends StatefulWidget {
  const BookAnAppointMentScreen({Key? key})
      : super(key: key);

  @override
  State<BookAnAppointMentScreen> createState() =>
      _BookAnAppointMentScreenState();
}

class _BookAnAppointMentScreenState
    extends State<BookAnAppointMentScreen> {
  int selectedStoreDate = 0;
  int selectedSlot = 0;

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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                  Icons.arrow_back_ios_rounded)),
          title: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: greyColor,
                    image: DecorationImage(
                        image: AssetImage(
                            Images.networkImage),
                        fit: BoxFit.fill),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.start,
                children: const [
                  Text(
                    "Makeup By Marina",
                  ),
                  Text(
                    "Laxmi Nagar, Bhubaneswar",
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          mainAxisAlignment:
              MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Store Visit Tokens",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 8, bottom: 8),
              child: Text(
                  "Select the date when you wish to visit the Store"),
            ),
            SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection:
                      Axis.horizontal,
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedStoreDate = index;
                        setState(() {});
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          10)),
                          child: Container(
                            decoration:
                                BoxDecoration(
                              color:
                                  selectedStoreDate ==
                                          index
                                      ? lightblue
                                      : whiteColor,
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          10),
                              border: Border.all(
                                color: selectedStoreDate ==
                                        index
                                    ? blueColor
                                    : greyColor,
                                width: 1,
                              ),
                            ),
                            padding:
                                const EdgeInsets
                                    .all(10.0),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                              children: const [
                                TitleString(
                                    title:
                                        "Today, 14 Dec",
                                    fontSize: 16),
                                SizedBox(
                                    height: 10),
                                Text(
                                  "8 / 20 Slots Available",
                                  style: TextStyle(
                                      color:
                                          greenColor),
                                )
                              ],
                            ),
                          )),
                    );
                  },
                )),
            const SizedBox(height: 10),
            const Divider(
              height: 1,
              color: greyColor,
              endIndent: 8,
              indent: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 8, top: 10, bottom: 8),
              child: Text(
                "Select Your Slot",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height / 2,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius:
                      BorderRadius.circular(10),
                  border: Border.all(
                    color: greyColor,
                    width: 1,
                  ),
                ),
                child: GridView.builder(
                  padding:
                      const EdgeInsets.all(0),
                  itemCount: 15,
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 120,
                          childAspectRatio:
                              3 / 1.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                  shrinkWrap: false,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedSlot = index;
                        setState(() {});
                      },
                      child: Container(
                          height: 40,
                          alignment:
                              Alignment.center,
                          decoration:
                              BoxDecoration(
                            color: selectedSlot ==
                                    index
                                ? lightblue
                                : whiteColor,
                            borderRadius:
                                BorderRadius
                                    .circular(10),
                            border: Border.all(
                              color:
                                  selectedSlot ==
                                          index
                                      ? blueColor
                                      : greyColor,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              const Spacer(),
                              Text(
                                "Token ${index + 1}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight
                                            .w500),
                              ),
                              const Spacer(),
                              const Text(
                                "11:30 AM",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight
                                            .w400),
                              ),
                              const Spacer(),
                            ],
                          )),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProceedToBookAppointmentScreen(),
                      ));
                },
                child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius:
                            BorderRadius.circular(
                                5)),
                    alignment: Alignment.center,
                    child: const Text(
                      "Proceed to Book Appointment",
                      style: TextStyle(
                          fontSize: 16,
                          color: whiteColor),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
