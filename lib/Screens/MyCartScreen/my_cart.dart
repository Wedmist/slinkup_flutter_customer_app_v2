import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_constants.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Screens/MyCartScreen/CartScreens/data_and_time_screen.dart';
import 'package:flutter_customer_app/Utils/constants.dart';
import 'package:flutter_customer_app/dash_board_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/cart/cart_data_model.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  // int? itemCount;
  // List<int> cartItems = [1, 2, 3, 4, 5];
  List<CartData>? cartData;
  @override
  void initState() {
    // TODO: implement initState
    getCartData();
    super.initState();
  }

  getCartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId');
    cartData = await ApiHelpers().getCartData(api: getCartDataApi + userId.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width =
    //     MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ));
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: const Text("Cart"),
        ),
        body: cartData == null
            ? Center(
                child: Text(
                  "Add Some Items",
                  style: TextStyle(fontSize: 20, color: blueColor),
                ),
              )
            : cartData?.length == 0
                ? Center(
                    child: Text(
                      "Add Some Items",
                      style: TextStyle(fontSize: 20, color: blueColor),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: cartData?.length,
                          itemBuilder: (context, index) {
                            CartData? carData = cartData?[index];
                            return Card(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 25,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.store,
                                            size: 30,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            carData?.name ?? "",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      carData?.category ?? "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: carData!.subServices!.length * 120,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: carData.subServices?.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          SubService? subServices = carData.subServices?[index];

                                          // itemCount = subServices?.count;
                                          return SizedBox(
                                              height: height / 7,
                                              child: Row(children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(height: 5),
                                                          Text(
                                                            subServices?.subServiceName ?? "",
                                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                          ),
                                                          const SizedBox(height: 5),
                                                          Row(
                                                            children: [
                                                              Text(subServices?.subServicePrice.toString() ?? "",
                                                                  style: TextStyle(
                                                                      fontSize: 16, fontWeight: FontWeight.w500)),
                                                              SizedBox(width: 10),
                                                              Text(
                                                                "₹3000",
                                                                style: TextStyle(
                                                                    decoration: TextDecoration.lineThrough,
                                                                    fontSize: 16,
                                                                    color: greyColor),
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            children: [
                                                              Card(
                                                                margin: const EdgeInsets.all(0),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(15)),
                                                                color: greenColor,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    padding: const EdgeInsets.only(
                                                                        left: 8, right: 8, top: 6, bottom: 6),
                                                                    child: const Text(
                                                                      "40% off",
                                                                      style: TextStyle(
                                                                          color: whiteColor,
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500),
                                                                    )),
                                                              ),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 30),
                                                  child: Container(
                                                    width: 70,
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5), color: lightblue),
                                                    child: Row(
                                                      children: [
                                                        // InkWell(
                                                        //     onTap: () async {
                                                        //       SharedPreferences prefs =
                                                        //           await SharedPreferences.getInstance();
                                                        //       var userId = prefs.getInt('userId');
                                                        //       Map<String, dynamic> params = {
                                                        //         "customer_user_id": userId,
                                                        //         "provider_user_id": carData.customerUserId,
                                                        //         "sub_service_id": carData.subServices?[index].subServiceId,
                                                        //       };
                                                        //       // _itemCount--;
                                                        //       Map minus = await ApiHelpers().postAddToCart(
                                                        //         addToCartMinusButton,
                                                        //         params,
                                                        //       );
                                                        //       debugPrint(minus.toString());
                                                        //       if (minus['status'] == 200) {
                                                        //         getCartData();
                                                        //         // itemCount = itemCount! - 1;
                                                        //       }
                                                        //       setState(() {});
                                                        //       // _itemCount--;
                                                        //       // setState(() {});
                                                        //     },
                                                        //     child: const Icon(
                                                        //       Icons.remove,
                                                        //       color: blueColor,
                                                        //       size: 16,
                                                        //     )),
                                                        Container(
                                                          margin: const EdgeInsets.symmetric(horizontal: 3),
                                                          padding:
                                                              const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                                          child: Text(
                                                            "Qty: " + subServices!.count.toString(),
                                                            // _itemCount.toString(),
                                                            style: const TextStyle(color: Colors.black, fontSize: 16),
                                                          ),
                                                        ),
                                                        // InkWell(
                                                        //     onTap: () async {
                                                        //       SharedPreferences prefs =
                                                        //           await SharedPreferences.getInstance();
                                                        //       var userId = prefs.getInt('userId');
                                                        //       Map<String, dynamic> params = {
                                                        //         "customer_user_id": userId,
                                                        //         "provider_user_id": carData.customerUserId,
                                                        //         "category_id": carData.categoryId,
                                                        //         "service_id": carData.subServices?[index].serviceId,
                                                        //         "sub_service_id": carData.subServices?[index].subServiceId,
                                                        //         "add_on_services_ids": [
                                                        //           "1684752390863",
                                                        //           "1687192876572",
                                                        //           "1687193694256"
                                                        //         ]
                                                        //       };
                                                        //       Map add = await ApiHelpers().postAddToCart(addToCart, params);
                                                        //       debugPrint(add.toString());
                                                        //       if (add['status'] == 200) {
                                                        //         getCartData();
                                                        //         // itemCount = itemCount! + 1;
                                                        //       }
                                                        //       // _itemCount++;
                                                        //       setState(() {});
                                                        //     },
                                                        //     child: const Icon(
                                                        //       Icons.add,
                                                        //       color: blueColor,
                                                        //       size: 16,
                                                        //     )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]));
                                        },
                                      )),

                                  const Divider(height: 1, color: greyColor),
                                  ListTile(
                                    title: Text("Add More items"),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: blackColor,
                                    ),
                                  ),
                                  const Divider(height: 1, color: greyColor),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DateAndTimeScreen(categoryId: carData.categoryId),
                                            ));
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration:
                                            BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Continue",
                                          style:
                                              TextStyle(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //    const Divider(color: greyColor, height: 1),
                                  // // (cartData?.length - 1) == index
                                  // //     ? SizedBox(
                                  // //         height: 50,
                                  // //         child: Row(
                                  // //           children: const [
                                  // //             Text("Add more items"),
                                  // //             Spacer(),
                                  // //             Icon(Icons.arrow_forward_ios_rounded)
                                  // //           ],
                                  // //         ),
                                  // //       )
                                  // //     : const SizedBox(),
                                  // // (cartItems.length - 1) == index ? const Divider(height: 1, color: greyColor) : const SizedBox(),
                                  // const SizedBox(height: 50)
                                ],
                              ),
                            );
                          },
                        )),
                      ],
                    ),
                  ),
      ),
    );
  }
}
