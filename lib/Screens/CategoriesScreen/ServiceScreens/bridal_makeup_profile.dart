import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/explore_cat_scree.dart';
import 'package:flutter_customer_app/Screens/MyCartScreen/my_cart.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Apis/api_constants.dart';
import '../../../Model/get_sub_services_provider_detailsa_model.dart';
import '../../../Utils/constants.dart';
import 'BottonSheets/birdal_makeup_call_category.dart';
import 'BottonSheets/birdal_makeup_profile_tile.dart';

class BridalMakeupProfile extends StatefulWidget {
  const BridalMakeupProfile({
    Key? key,
    required this.title,
    this.serviceArea,
    required this.serviceId,
    required this.serviceUserId,
    required this.categoryId,
  }) : super(key: key);
  final String title;
  final String? serviceArea;
  final int serviceId;
  final int serviceUserId;
  final int categoryId;
  @override
  State<BridalMakeupProfile> createState() => _BridalMakeupProfileState();
}

class _BridalMakeupProfileState extends State<BridalMakeupProfile> {
  int total = 0;
  GetServiceUserDataModel getServiceUserData = GetServiceUserDataModel();
  @override
  void initState() {
    fetchSubservice();
    // TODO: implement initState
    super.initState();
  }

  fetchSubservice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId');

    getServiceUserData = await ApiHelpers()
        .fetchSubServiceByUserID(api: "$getSubServiceWithProviderDetails${widget.serviceUserId}/customer_id/$userId");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            title: const Text("Bridal Makeup"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  ))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    // showCategoryBottomSheet();
                  },
                  child: BirdalMakeUpProfileTile(
                      title: widget.title, serviceArea: widget.serviceArea, getServiceUserData: getServiceUserData)),
              const SizedBox(height: 2),
              BirdalMakeupCallCategory(getServiceUserData: getServiceUserData),
              const SizedBox(height: 5),
              Container(
                  height: 40,
                  width: width,
                  // padding: const EdgeInsets.all(18),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  color: whiteColor,
                  child: const Text(
                    "Explore Catalog",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  )),
              getServiceUserData.services == null
                  ? const SizedBox()
                  : Expanded(
                      child: ExploreCategoryScreen(
                      getServiceUserData: getServiceUserData,
                      cartView: (int? price, int? quantity) {
                        // total = price;
                        // count = quantity;
                        int cartTotal = price! * quantity!;
                        total = cartTotal + total;
                        setState(() {});
                      },
                    )),
              Container(
                height: 60,
                color: whiteColor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 12),
                      child: Column(
                        children: [
                          Text(
                            "₹$total",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          // Text(
                          //   "2 items",
                          //   style: TextStyle(fontSize: 10),
                          // )
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const MyCart();
                          },
                        ));
                      },
                      child: Container(
                          padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          decoration: BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              const SizedBox(width: 15),
                              Image.asset(
                                Images.cart,
                                scale: 3.0,
                                color: whiteColor,
                                alignment: Alignment.center,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "View Cart",
                                style: TextStyle(color: whiteColor, fontSize: 18),
                              ),
                              const SizedBox(width: 15),
                            ],
                          )),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
