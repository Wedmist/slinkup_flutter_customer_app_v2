import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_constants.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Model/add_to_cart_button_model.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utils/constants.dart';
import '../../../MyCartScreen/my_cart.dart';

class CatBottomSheet extends StatefulWidget {
  final Data addToCartView;
  final int count;
  const CatBottomSheet({
    Key? key,
    required this.addToCartView,
    required this.count,
  }) : super(key: key);

  @override
  State<CatBottomSheet> createState() => _CatBottomSheetState();
}

class _CatBottomSheetState extends State<CatBottomSheet> {
  int? itemCount;
  List<String> selectedAdService = [];
  @override
  void initState() {
    itemCount = widget.count;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Images.bestSellerimg))),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              SizedBox(
                                width: width / 1.8,
                                child: Text(
                                  widget.addToCartView.subServiceDetails.serviceName ?? "",
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: greenColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: greenColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: greenColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: greenColor,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: greenColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "(4.7)",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.addToCartView.subServiceDetails.servicePrice.toString(),
                                maxLines: 1,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: lightblue),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () async {
                                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                                              // var userId = prefs.getInt('userId');
                                              // Map<String, dynamic> params = {
                                              //   "customer_user_id": userId.toString(),
                                              //   "provider_user_id":
                                              //       widget.addToCartView.subServiceDetails.userId.toString(),
                                              //   "sub_service_id":
                                              //       widget.addToCartView.subServiceDetails.subServiceId.toString(),
                                              // };
                                              // Map minus = await ApiHelpers().postAddToCart(
                                              //   addToCartMinusButton,
                                              //   params,
                                              // );
                                              // debugPrint(minus.toString());
                                              // if (minus['status'] == 200) {
                                              //   itemCount = itemCount! - 1;
                                              // }
                                              // setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.remove,
                                              color: blueColor,
                                              size: 16,
                                            )),
                                        Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 3),
                                          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                          child: Text(
                                            itemCount.toString(),
                                            style: const TextStyle(color: Colors.black, fontSize: 16),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () async {
                                              // SharedPreferences prefs = await SharedPreferences.getInstance();
                                              // var userId = prefs.getInt('userId');
                                              // Map<String, dynamic> params = {
                                              //   "customer_user_id": userId.toString(),
                                              //   "provider_user_id":
                                              //       widget.addToCartView.subServiceDetails.userId.toString(),
                                              //   "category_id":
                                              //       widget.addToCartView.subServiceDetails.categoryId.toString(),
                                              //   "service_id":
                                              //       widget.addToCartView.subServiceDetails.serviceId.toString(),
                                              //   "sub_service_id":
                                              //       widget.addToCartView.subServiceDetails.subServiceId.toString(),
                                              //   "add_on_services_ids": []
                                              // };
                                              // Map add = await ApiHelpers().postAddToCart(addToCart, params);
                                              // debugPrint(add.toString());
                                              // if (add['status'] == 200) {
                                              //   itemCount = itemCount! + 1;
                                              // }

                                              // setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.add,
                                              color: blueColor,
                                              size: 16,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: const [Icon(Icons.share, size: 16), Text("Share")],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          widget.addToCartView.subServiceDetails.image == null
                              ? SizedBox(height: 120, width: 120, child: Image.asset('assets/Images/Image_gallery.png'))
                              : Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          // fit: BoxFit.fill,
                                          image: NetworkImage(
                                        widget.addToCartView.subServiceDetails.image ?? '',
                                      )),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      )),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: Text(
                    widget.addToCartView.subServiceDetails.description ?? '',
                    maxLines: 2,
                    // "Cleanse your face. Before you apply makeup to your face, you'll want to wash it and remove any excess oils or dirt. Use a gentle cleanser and wash your face with warm water and then pat it dry with a towel. If you are going to a party at night and have makeup on from the day, remove the makeup with makeup remover cloths or solutions before you wash your face."
                  ),
                ),
                const Divider(
                  height: 1,
                  color: greyColor,
                ),
                const SizedBox(height: 10),
                const TitleString(title: "Add-On Services", fontSize: 16),
                const SizedBox(height: 5),
                widget.addToCartView.addOnServices == null
                    ? Text("No add on Services")
                    : SizedBox(
                        height: widget.addToCartView.addOnServices.length * 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.addToCartView.addOnServices.length,
                          itemBuilder: (context, index) {
                            AddOnService addOnServices = widget.addToCartView.addOnServices[index];
                            return CheckboxListTile(
                              title: Text(addOnServices.addOnServiceName ?? ""),
                              value: addOnServices.isSelected ?? false,
                              onChanged: (value) {
                                addOnServices.isSelected = value!;
                                String selectedlangId = addOnServices.addOnServiceId.toString();
                                selectedAdService.add(selectedlangId);
                                setState(() {});
                              },
                            );
                            // Row(
                            //   children: [
                            //     Image.asset(
                            //       Images.fastForward,
                            //       scale: 3,
                            //     ),
                            //     const SizedBox(width: 5),
                            //     Text(addOnServices.addOnServiceName ?? ""),
                            //     const Spacer(),
                            //     Text(
                            //       addOnServices.addOnServicePrice.toString(),
                            //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                            //     ),
                            //     Checkbox(
                            //       value: isCheckBox3,
                            //       onChanged: (bool? value) {
                            //         setState(() {
                            //           isCheckBox3 = value!;
                            //         });
                            //       },
                            //     ),
                            //   ],
                            // );
                          },
                        ),
                      ),
                // Row(
                //   children: [
                //     Image.asset(
                //       Images.fastForward,
                //       scale: 3,
                //     ),
                //     const SizedBox(width: 5),
                //     const Text("Facial & Clean-up"),
                //     const Spacer(),
                //     const Text(
                //       "₹1199",
                //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                //     ),
                //     Checkbox(
                //       value: isCheckBox1,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isCheckBox1 = value!;
                //         });
                //       },
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Image.asset(
                //       Images.fastForward,
                //       scale: 3,
                //     ),
                //     const SizedBox(width: 5),
                //     const Text("Facial & Clean-up"),
                //     const Spacer(),
                //     const Text(
                //       "₹229",
                //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                //     ),
                //     Checkbox(
                //       value: isCheckBox2,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isCheckBox2 = value!;
                //         });
                //       },
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     Image.asset(
                //       Images.fastForward,
                //       scale: 3,
                //     ),
                //     const SizedBox(width: 5),
                //     const Text("Facial & Clean-up"),
                //     const Spacer(),
                //     const Text(
                //       "₹809",
                //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                //     ),
                //     Checkbox(
                //       value: isCheckBox3,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           isCheckBox3 = value!;
                //         });
                //       },
                //     ),
                //   ],
                // ),
                const Divider(
                  height: 1,
                  color: greyColor,
                ),
                const SizedBox(height: 10),
                const TitleString(title: "What Wedmist Assures You", fontSize: 16),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star_border, color: greenColor, size: 18),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: width - 80,
                      child: const Text(
                        "Suprime quality service at best Price",
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star_border, color: greenColor, size: 18),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: width - 80,
                      child: const Text(
                        "Trained & Verified Professionals with 4+ Years of Experience",
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star_border, color: greenColor, size: 18),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: width - 80,
                      child: const Text("100% Hygienic and Mess-free"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star_border, color: greenColor, size: 18),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: width - 80,
                      child: const Text("100% Hygienic and Mess-free"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star_border, color: greenColor, size: 18),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: width - 80,
                      child: const Text("100% Hygienic and Mess-free"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    var userId = prefs.getInt('userId');
                    Map<String, dynamic> params = {
                      "customer_user_id": userId.toString(),
                      "provider_user_id": widget.addToCartView.subServiceDetails.userId.toString(),
                      "category_id": widget.addToCartView.subServiceDetails.categoryId.toString(),
                      "service_id": widget.addToCartView.subServiceDetails.serviceId.toString(),
                      "sub_service_id": widget.addToCartView.subServiceDetails.subServiceId.toString(),
                      "add_on_services_ids": selectedAdService
                    };
                    Map add = await ApiHelpers().postAddToCart(addToCart, params);
                    debugPrint(add.toString());
                    if (add['status'] == 200) {
                      itemCount = itemCount! + 1;
                    }
                    Navigator.pop(context);
                    // setState(() {});
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCart()));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add Item to Cart (₹${widget.addToCartView.subServiceDetails.servicePrice.toString()})",
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
