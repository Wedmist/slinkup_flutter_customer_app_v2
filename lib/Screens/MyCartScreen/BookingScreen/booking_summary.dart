// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Model/cart/booking_summery_model.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Screens/RewardsScreen/coupon_screen.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Apis/api_constants.dart';
import '../../../Apis/api_helper.dart';
import '../../../Model/cart/place_order_model.dart';
import '../../../Utils/constants.dart';
import '../../CategoriesScreen/ServiceScreens/booking_confirmed.dart';

class BookingSummaryScreen extends StatefulWidget {
  final BookingSummeryModel? bookingSummery;
  const BookingSummaryScreen({
    Key? key,
    this.bookingSummery,
  }) : super(key: key);

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  int? itemCount;
  int? totalPrice;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: lightBackGroundColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            title: const Text("Booking Summary"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: SizedBox(
                      height: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on_rounded, color: redColor, size: 18),
                                  const SizedBox(width: 2),
                                  SizedBox(
                                    width: width / 1.25,
                                    child: Text(
                                      widget.bookingSummery?.data.addressDatetime.address ?? "",
                                      maxLines: 2,
                                    ),
                                  ),
                                  const Icon(Icons.edit, color: blueColor, size: 16)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Divider(height: 1, color: greyColor),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  IconsView.clockIcon,
                                  scale: 4,
                                ),
                                const SizedBox(width: 4),
                                SizedBox(
                                  width: width / 1.25,
                                  child: Text(
                                    "${widget.bookingSummery!.data.addressDatetime.dateTime.day}/${widget.bookingSummery!.data.addressDatetime.dateTime.month}/${widget.bookingSummery!.data.addressDatetime.dateTime.year}"

                                    // widget.bookingSummery?.data.addressDatetime.dateTime.toString() ?? "",
                                    ,
                                    maxLines: 1,
                                  ),
                                ),
                                const Icon(Icons.edit, color: blueColor, size: 16)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: whiteColor,
                      // height: 180,
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
                              ),
                              const SizedBox(width: 15),
                              const TitleString(title: "Cart Summary", fontSize: 18)
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: widget.bookingSummery!.data.subServices.length * 62,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.bookingSummery?.data.subServices.length,
                              itemBuilder: (context, index) {
                                SubService? subService = widget.bookingSummery?.data.subServices[index];
                                itemCount = subService?.cartCount;
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                TitleString(title: subService?.serviceName ?? "", fontSize: 14),
                                                SizedBox(height: 8),
                                                TitleString(
                                                    title: subService?.servicePrice.toString() ?? "", fontSize: 15)
                                              ])),
                                          Expanded(
                                              flex: 1,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 80,
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: blueColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius: BorderRadius.circular(5),
                                                        color: lightblue),
                                                    child: Row(
                                                      children: [
                                                        const Spacer(),
                                                        InkWell(
                                                            onTap: () async {
                                                              SharedPreferences prefs =
                                                                  await SharedPreferences.getInstance();
                                                              var userId = prefs.getInt('userId');
                                                              Map<String, dynamic> params = {
                                                                "customer_user_id": userId.toString(),
                                                                "provider_user_id":
                                                                    subService?.customerUserId.toString(),
                                                                "sub_service_id": subService?.subServiceId.toString(),
                                                              };
                                                              Map minus = await ApiHelpers().postAddToCart(
                                                                addToCartMinusButton,
                                                                params,
                                                              );
                                                              debugPrint(minus.toString());
                                                              if (minus['status'] == 200) {
                                                                itemCount = itemCount! - 1;
                                                              }
                                                              setState(() {});
                                                            },
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color: blueColor,
                                                              size: 16,
                                                            )),
                                                        const Spacer(),
                                                        Container(
                                                          margin: const EdgeInsets.symmetric(horizontal: 3),
                                                          padding:
                                                              const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                                          child: Text(
                                                            subService!.cartCount.toString(),
                                                            style: const TextStyle(color: Colors.black, fontSize: 16),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        InkWell(
                                                            onTap: () async {
                                                              SharedPreferences prefs =
                                                                  await SharedPreferences.getInstance();

                                                              var userId = prefs.getInt('userId');
                                                              Map<String, dynamic> params = {
                                                                "customer_user_id": userId.toString(),
                                                                "provider_user_id":
                                                                    subService.customerUserId.toString(),
                                                                "category_id": subService.categoryId.toString(),
                                                                "service_id": subService.serviceId.toString(),
                                                                "sub_service_id": subService.subServiceId.toString(),
                                                                "add_on_services_ids": []
                                                              };
                                                              Map add =
                                                                  await ApiHelpers().postAddToCart(addToCart, params);
                                                              debugPrint(add.toString());
                                                              if (add['status'] == 200) {
                                                                itemCount = itemCount! + 1;
                                                              }

                                                              setState(() {});
                                                            },
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: blueColor,
                                                              size: 16,
                                                            )),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                    const Divider(height: 1, color: greyColor),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
                    child: Container(
                      color: whiteColor,
                      height: 240,
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
                              ),
                              const SizedBox(width: 15),
                              const TitleString(title: "Cart Summary", fontSize: 18),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                              height: 195,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: whiteColor,
                                          border: Border.all(
                                            color: greyColor,
                                            width: 1,
                                          )),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 100,
                                            decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        "https://dl.fujifilm-x.com/global/products/cameras/x-t3/sample-images/ff_x_t3_002.JPG"),
                                                    fit: BoxFit.fill),
                                                borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                                                color: whiteColor,
                                                border: Border.all(
                                                  color: blackColor,
                                                  width: 1,
                                                )),
                                          ),
                                          const SizedBox(height: 5),
                                          const TitleString(title: "Addon Service 1", fontSize: 14),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              const TitleString(title: "₹999", fontSize: 14),
                                              const Spacer(),
                                              Container(
                                                  width: 75,
                                                  height: 30,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: blueColor,
                                                        width: 1,
                                                      ),
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: lightblue),
                                                  child: Row(
                                                    children: [
                                                      const Spacer(),
                                                      const Text(
                                                        "Add",
                                                        style: TextStyle(color: blueColor),
                                                      ),
                                                      const Spacer(),
                                                      Container(
                                                        width: 1,
                                                        height: 20,
                                                        color: blueColor,
                                                      ),
                                                      const Spacer(),
                                                      const Icon(Icons.add, color: blueColor, size: 18),
                                                      const Spacer(),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CouponScreen(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
                      child: Container(
                        color: whiteColor,
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              width: 5,
                              height: 20,
                              decoration: const BoxDecoration(
                                  color: blueColor,
                                  borderRadius:
                                      BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(Images.coupon, scale: 3, color: greenColor),
                            const SizedBox(width: 15),
                            const TitleString(title: "Apply Coupon", fontSize: 18),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios_rounded),
                            const SizedBox(width: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
                    child: Container(
                      color: whiteColor,
                      // height: 200,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
                              ),
                              const SizedBox(width: 10),
                              const TitleString(title: "Estimated Billing Price", fontSize: 18),
                            ],
                          ),
                          SizedBox(
                            height: widget.bookingSummery!.data.billingPrice.length * 55,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget.bookingSummery?.data.billingPrice.length,
                              itemBuilder: (context, index) {
                                BillingPrice? billingPrice = widget.bookingSummery?.data.billingPrice[index];
                                totalPrice = billingPrice!.quantity * billingPrice.price;
                                return Padding(
                                  padding: const EdgeInsets.only(top: 12, bottom: 8, left: 10, right: 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            billingPrice.name,
                                            maxLines: 2,
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                "₹${billingPrice.quantity} x ₹${billingPrice.price} = ₹$totalPrice"),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 12, bottom: 8, left: 10, right: 8),
                          //   child: Row(
                          //     children: const [
                          //       Expanded(
                          //           flex: 2,
                          //           child: Text(
                          //             "Basic Party Makeup for Family",
                          //             maxLines: 2,
                          //           )),
                          //       Expanded(
                          //           flex: 1,
                          //           child: Align(
                          //             alignment: Alignment.centerRight,
                          //             child: Text("2 x ₹150 = ₹300"),
                          //           )),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 12, bottom: 16, left: 10, right: 8),
                          //   child: Row(
                          //     children: const [
                          //       Expanded(
                          //           flex: 2,
                          //           child: Text(
                          //             "Coupon - FLAT100",
                          //             style: TextStyle(color: greenColor),
                          //             maxLines: 2,
                          //           )),
                          //       Expanded(
                          //           flex: 1,
                          //           child: Align(
                          //             alignment: Alignment.centerRight,
                          //             child: Text("- ₹100"),
                          //           )),
                          //     ],
                          //   ),
                          // ),
                          const Divider(indent: 8, endIndent: 8, height: 1, color: greyColor),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 16, left: 10, right: 8),
                            child: Row(
                              children: [
                                const Expanded(flex: 2, child: TitleString(title: "Total Amount:", fontSize: 16)),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TitleString(title: "₹ $totalPrice", fontSize: 16),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      color: whiteColor,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: blueColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5), bottomRight: Radius.circular(5))),
                              ),
                              const SizedBox(width: 10),
                              const TitleString(title: "Estimated Billing Price", fontSize: 18),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.fiber_manual_record_rounded, size: 12),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: width / 1.2,
                                child: const Text(
                                  "Final bill will be generated by the service provider based on the services you avail.",
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.fiber_manual_record_rounded, size: 12),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: width / 1.2,
                                child: const Text(
                                  "Final bill will be generated by the service provider based on the services you avail.",
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            height: 1,
                            endIndent: 8,
                            indent: 8,
                            color: greyColor,
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () async {
                              List<String> subServicesList = [];
                              for (SubService subservice in widget.bookingSummery!.data.subServices) {
                                subServicesList.add(subservice.subServiceId.toString());
                              }
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var userId = prefs.getInt('userId');

                              Map<String, dynamic> parms = {
                                "order_image":
                                    "https://static.wikia.nocookie.net/the-incredibles/images/6/68/I2_-_Edna.webp/revision/latest?cb=20221213193008",
                                "customer_user_id": userId.toString(),
                                "provider_user_id": widget.bookingSummery?.data.subServices.first.providerUserId,
                                "category_id": widget.bookingSummery?.data.subServices.first.categoryId.toString(),
                                "service_id": widget.bookingSummery?.data.subServices.first.serviceId.toString(),
                                "sub_service_ids": subServicesList,
                                "add_on_service_ids": [1684752390863, 1684752390863, 1684752390863],
                                "order_datetime": widget.bookingSummery?.data.addressDatetime.dateTime.toString(),
                                "total_amount": totalPrice.toString(),
                                "service_location": widget.bookingSummery?.data.addressDatetime.address,
                                "payment_method": "cash"
                              };
                              //     {
                              //   "order_image":
                              //       "https://static.wikia.nocookie.net/the-incredibles/images/6/68/I2_-_Edna.webp/revision/latest?cb=20221213193008",
                              //   "customer_user_id": userId,
                              //   "provider_user_id": widget.bookingSummery?.data.subServices.first.providerUserId,
                              //   "category_id": widget.bookingSummery?.data.subServices.first.categoryId,
                              //   "service_id": widget.bookingSummery?.data.subServices.first.serviceId,
                              //   "sub_service_ids": [1685540476485, 1685540476485, 1685540476485],
                              //   "add_on_service_ids": [1684752390863, 1684752390863, 1684752390863],
                              //   "order_datetime": "2023-06-19T12:01:33+05:30",
                              //   "total_amount": "3000",
                              //   "service_location": "Smart Village, Bhubaneswar",
                              //   "payment_method": "cash"
                              // };
                              PlaceOrderModel? placeAnOrder = await ApiHelpers().placeOrderSummery(
                                params: parms,
                                postUrl: palceOrderApi,
                              );
                              if (placeAnOrder?.status == 200) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookingConfirmed(placeAnOrder: placeAnOrder),
                                    ));
                              }
                            },
                            child: Container(
                              color: buttonColor,
                              height: 40,
                              alignment: Alignment.center,
                              child: const Text(
                                "Book Service Professional",
                                style: TextStyle(fontWeight: FontWeight.w500, color: whiteColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
