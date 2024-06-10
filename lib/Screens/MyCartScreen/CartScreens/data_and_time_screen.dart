// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Screens/MyCartScreen/BookingScreen/booking_summary.dart';
import 'package:flutter_customer_app/Screens/MyCartScreen/cart_constants.dart';
import 'package:flutter_customer_app/Screens/MyProfileScreen/manage_address.dart';
import 'package:flutter_customer_app/Utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Apis/api_constants.dart';
import '../../../Model/address/get_all_address_model.dart';
import '../../../Model/cart/booking_summery_model.dart';

class DateAndTimeScreen extends StatefulWidget {
  final int? categoryId;
  const DateAndTimeScreen({Key? key, this.categoryId}) : super(key: key);

  @override
  State<DateAndTimeScreen> createState() => _DateAndTimeScreenState();
}

class _DateAndTimeScreenState extends State<DateAndTimeScreen> {
  SelectDate selDate = SelectDate.today;
  AddressModel address = AddressModel();
  int onTapSelectAddress = 0;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            title: const Text("Date & Time"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: lightblue,
                height: 40,
                child: address.addressId == null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ManageAddress(updateAdress: (AddressModel ads) {
                                address = ads;
                                setState(() {});
                              });
                            },
                          ));
                        },
                        child: const Row(
                          children: [
                            SizedBox(width: 5),
                            Icon(
                              Icons.add,
                              color: blueColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Add Your Address",
                              style: TextStyle(fontSize: 15, color: blueColor, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          children: [
                            Text(
                              "${address.houseNumber},${address.landmark},${address.city},${address.state},${address.pincode}",
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                            // Spacer(),
                            // IconButton(
                            //     onPressed: () {
                            //       Navigator.push(context, MaterialPageRoute(
                            //         builder: (context) {
                            //           return EditAddress(
                            //               updateAdress: (ads) {
                            //                 address = ads;
                            //                 setState(() {});
                            //               },
                            //               address: address);
                            //         },
                            //       ));
                            //     },
                            //     icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 4),
                child: TitleString(title: "Select Date of Service", fontSize: 16),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: 40,
                  child: Text("Select the date when you need the service jsadh sas sdj a Wsjf ss d"),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      selDate = SelectDate.today;
                      selectedDate = DateTime.now();
                      setState(() {});
                    },
                    child: Card(
                      color: SelectDate.today == selDate ? lightblue : whiteColor,
                      child: const SizedBox(
                        height: 50,
                        width: 100,
                        child: Align(
                            alignment: Alignment.center,
                            child: TitleString(
                              title: "Today",
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      selDate = SelectDate.tomorrow;
                      selectedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1);
                      setState(() {});
                    },
                    child: Card(
                      color: SelectDate.tomorrow == selDate ? lightblue : whiteColor,
                      child: const SizedBox(
                        height: 50,
                        width: 100,
                        child: Align(
                            alignment: Alignment.center,
                            child: TitleString(
                              title: "Tomorrow",
                              fontSize: 14,
                            )),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      selDate = SelectDate.none;
                      _selectDate(context);
                      setState(() {});
                    },
                    child: const Card(
                      color: blueColor,
                      child: SizedBox(
                        height: 50,
                        width: 115,
                        child: Row(
                          children: [
                            Spacer(),
                            Text(
                              "Select Date",
                              style: TextStyle(
                                  color: whiteColor, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "Roboto"),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 28,
                              color: whiteColor,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
              // const Padding(
              //   padding: EdgeInsets.only(top: 10, left: 8, bottom: 10),
              //   child: TitleString(title: "When would you like your service?", fontSize: 15),
              // ),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: GridView.builder(
              //         padding: const EdgeInsets.all(0),
              //         physics: const NeverScrollableScrollPhysics(),
              //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //             maxCrossAxisExtent: 180,
              //             childAspectRatio: 3 / 0.8,
              //             crossAxisSpacing: 20,
              //             mainAxisSpacing: 10),
              //         itemCount: 14,
              //         itemBuilder: (BuildContext ctx, index) {
              //           return GestureDetector(
              //             onTap: () {
              //               onTapSelectAddress = index;
              //               setState(() {});
              //             },
              //             child: Container(
              //               height: 40,
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                   color: onTapSelectAddress == index ? lightblue : whiteColor,
              //                   border: Border.all(
              //                     color: onTapSelectAddress == index ? blueColor : greyColor,
              //                     width: 1,
              //                   ),
              //                   borderRadius: BorderRadius.circular(5)),
              //               child: Text(
              //                 "10:00 AM-11:00 AM",
              //                 style: TextStyle(color: onTapSelectAddress == index ? blueColor : blackColor),
              //               ),
              //             ),
              //           );
              //         }),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    var userId = prefs.getInt('userId');
                    Map<String, dynamic> parms = {
                      "address":
                          "${address.houseNumber},${address.landmark},${address.city},${address.state},${address.pincode}",
                      "date_time": selectedDate.toString(),
                      "customer_user_id": userId.toString(),
                      "category_id": widget.categoryId.toString()
                    };
                    BookingSummeryModel? bookingSummery = await ApiHelpers().postBookingSummery(
                      params: parms,
                      postUrl: getBookingSummery,
                    );
                    if (bookingSummery?.status == 200) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingSummaryScreen(bookingSummery: bookingSummery),
                          ));
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
