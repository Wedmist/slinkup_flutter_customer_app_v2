import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Model/cart/place_order_model.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/Components/home_icon.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Screens/MyCartScreen/BookingScreen/thankyou_screen.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:intl/intl.dart';

import '../../../Utils/constants.dart';

class BookingConfirmed extends StatefulWidget {
  final PlaceOrderModel? placeAnOrder;
  const BookingConfirmed({
    Key? key,
    this.placeAnOrder,
  }) : super(key: key);

  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
            "Booking Confirmed",
            style: TextStyle(color: whiteColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: width - 100,
                        child: Column(children: const [
                          TitleString(title: "Thank you, Your Appointment has been booked successfully.", fontSize: 20),
                          SizedBox(height: 10),
                          Text(
                            "Please reach to the service store 15 min before your appointed time.",
                            maxLines: 2,
                            style: TextStyle(),
                          ),
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image.asset(
                        Images.greenCouponImg,
                        scale: 4,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 8,
                color: greyLightColor,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: widget.placeAnOrder!.data.orderDetails.length * 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        widget.placeAnOrder?.data.orderDetails.first.orderImage == null
                                            ? SizedBox(
                                                height: 60,
                                                width: 60,
                                                child: Image.asset('assets/Images/Image_gallery.png'))
                                            : Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: greyColor,
                                                    image: DecorationImage(
                                                        image: NetworkImage(widget
                                                                .placeAnOrder?.data.orderDetails.first.orderImage
                                                                .toString() ??
                                                            ""),
                                                        fit: BoxFit.fill),
                                                    shape: BoxShape.circle),
                                              ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TitleString(
                                                title:
                                                    widget.placeAnOrder?.data.orderDetails.first.providerUserName ?? "",
                                                fontSize: 16),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: const [
                                                Icon(Icons.star, color: yellowColor),
                                                Icon(Icons.star, color: yellowColor),
                                                Icon(Icons.star, color: yellowColor),
                                                Icon(Icons.star, color: yellowColor),
                                                Icon(Icons.star, color: yellowColor),
                                                SizedBox(width: 5),
                                                TitleString(title: "(4.7)", fontSize: 14)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Services",
                                            style: TextStyle(color: greyColor, fontSize: 14),
                                          ),
                                          Spacer(),
                                          Text(
                                            "Estimation Price",
                                            style: TextStyle(color: greyColor, fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView.builder(
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: widget.placeAnOrder?.data.subServices.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            OrderSubService? subservice = widget.placeAnOrder?.data.subServices[index];
                                            return Row(
                                              children: [
                                                Text(
                                                  "${index + 1}. " + subservice!.serviceName.toString(),
                                                  style: TextStyle(color: blackColor, fontSize: 16),
                                                ),
                                                Spacer(),
                                                Text(
                                                  subservice.servicePrice.toString(),
                                                  style: TextStyle(color: blackColor, fontSize: 16),
                                                )
                                              ],
                                            );
                                          }),
                                    )
                                  ],
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Spacer(),
                            const HomeIconView(wt: 160.0),
                            const Spacer(),
                            Container(
                              height: 50,
                              width: 160,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: greyLightColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "Go to My Bookings",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: GetlightblueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Card(
                  child: SizedBox(
                    height: 300,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Booking Details",
                            style: TextStyle(
                              fontSize: 20,
                              color: blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: greenColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Service Location",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width - 85,
                                    child: Text(
                                      widget.placeAnOrder?.data.orderDetails.first.serviceLocation.toString() ?? "",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: greyColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: GetlightblueColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Timing",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('EEE d MMM yyyy')
                                        .format(widget.placeAnOrder!.data.orderDetails.first.orderDatetime as DateTime),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: greyColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Image.asset(
                                IconsView.serviceStatusIcon,
                                scale: 2.5,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Service Status",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.placeAnOrder?.data.orderDetails.first.orderStatus.toString() ?? "",
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: greyColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                height: 50,
                                width: 160,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: greyLightColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  "Reschedule",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: greyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 50,
                                width: 160,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: blackColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  "Customer Support",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(Images.cancelPolicyImg),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Card(
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //           height: 100,
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                     flex: 2,
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Row(
              //                           children: [
              //                             Image.asset(
              //                               Images.house,
              //                               scale: 2.5,
              //                             ),
              //                             const SizedBox(width: 10),
              //                             const Text(
              //                               "Appointment Time",
              //                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              //                             ),
              //                           ],
              //                         ),
              //                         const SizedBox(height: 5),
              //                         const Text(
              //                           "Today, 11:30 AM",
              //                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              //                         ),
              //                         const SizedBox(height: 5),
              //                         Row(
              //                           children: [
              //                             Image.asset(
              //                               IconsView.clockIcon,
              //                               scale: 3.5,
              //                             ),
              //                             const SizedBox(width: 5),
              //                             const Text(
              //                               "in 2 hours 43 minutes",
              //                               style: TextStyle(color: greyColor, fontSize: 15, fontWeight: FontWeight.w400),
              //                             ),
              //                           ],
              //                         )
              //                       ],
              //                     )),
              //                 Expanded(
              //                     flex: 1,
              //                     child: Container(
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(10),
              //                           image: const DecorationImage(
              //                               image: AssetImage(Images.networkImage), fit: BoxFit.fill)),
              //                     ))
              //               ],
              //             ),
              //           ),
              //         ),
              //         const Padding(
              //           padding: EdgeInsets.only(left: 8, right: 8),
              //           child: Text(
              //             "Makeup By Marina, Laxmi Nagar Bhubaneswar",
              //             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Container(
              //             height: 45,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               border: Border.all(
              //                 color: lightGreenColor,
              //                 width: 1,
              //               ),
              //             ),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Image.asset(IconsView.greenRightIconView, scale: 3.5),
              //                 const SizedBox(width: 8),
              //                 const Text(
              //                   "Navigate to my Store",
              //                   style: TextStyle(color: greenColor, fontSize: 15, fontWeight: FontWeight.w400),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              //           child: Container(
              //               height: 45,
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(15),
              //                 border: Border.all(
              //                   color: blueColor,
              //                   width: 1,
              //                 ),
              //               ),
              //               child: const Text(
              //                 "See Booking Status",
              //                 style: TextStyle(color: blueColor, fontSize: 15, fontWeight: FontWeight.w500),
              //               )),
              //         ),
              //         const Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: CancellationPolicyTile(
              //               backGroundColor: whiteColor,
              //             ))
              //       ],
              //     ),
              //   ),
              // ),
              // const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThankYouScreen(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: blueColor), color: lightblue, borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blueColor),
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
