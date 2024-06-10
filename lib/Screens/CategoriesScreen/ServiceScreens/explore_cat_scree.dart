import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Model/get_sub_services_provider_detailsa_model.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/BottonSheets/cat_bottom_sheet.dart';
import 'package:flutter_customer_app/Utils/shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Apis/api_constants.dart';
import '../../../Model/add_to_cart_button_model.dart';
import '../../../Model/get_subservice_by_user_id_service_id.dart';
import '../../../Utils/Images.dart';
import '../../../Utils/constants.dart';

class ExploreCategoryScreen extends StatefulWidget {
  final GetServiceUserDataModel getServiceUserData;
  final Function(int? price, int? quantity) cartView;
  const ExploreCategoryScreen({Key? key, required this.getServiceUserData, required this.cartView}) : super(key: key);

  @override
  State<ExploreCategoryScreen> createState() => _ExploreCategoryScreenState();
}

class _ExploreCategoryScreenState extends State<ExploreCategoryScreen> {
  GetSubServiceModel? selectedSubService;
  List<GetSubServiceByServiceIdModel>? subServiceList;
  bool isLoading = false;
  @override
  void initState() {
    selectedSubService = widget.getServiceUserData.services?.first;

    if (widget.getServiceUserData.services != null) {
      fetchSubServiceByServiceId(serviceID: widget.getServiceUserData.services!.first.serviceId);
    }
    updateCart();
    super.initState();
  }

  void fetchSubServiceByServiceId({required int serviceID}) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId');
    Map<String, dynamic> params = {
      "customer_user_id": userId,
      "provider_user_id": widget.getServiceUserData.services?.first.userId,
      "service_id": serviceID
    };
    subServiceList = await ApiHelpers().getSubServiceByUserIdAndServiceId(getSubserviceByUserIdAndServiceId, params);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void didUpdateWidget(covariant ExploreCategoryScreen oldWidget) {
    if (oldWidget.getServiceUserData != widget.getServiceUserData) {
      fetchSubServiceByServiceId(serviceID: widget.getServiceUserData.services!.first.serviceId);
    }
    super.didUpdateWidget(oldWidget);
  }

  updateCart() {
    if (subServiceList == null) return;
    for (GetSubServiceByServiceIdModel subitem in subServiceList!) {
      Future.delayed(Duration.zero, () {
        widget.cartView(subitem.servicePrice, subitem.count);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        widget.getServiceUserData.services == null
            ? const SizedBox()
            : Container(
                color: whiteColor,
                height: 50,
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.getServiceUserData.services?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    GetSubServiceModel? subServiceModel = widget.getServiceUserData.services?[index];
                    return GestureDetector(
                      onTap: () {
                        fetchSubServiceByServiceId(serviceID: subServiceModel!.serviceId);
                        selectedSubService = subServiceModel;
                        setState(() {});
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: selectedSubService?.serviceName == subServiceModel?.serviceName ? blueColor : whiteColor,
                        child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            child: Text(
                              subServiceModel?.serviceName ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: selectedSubService?.serviceName == subServiceModel?.serviceName
                                      ? whiteColor
                                      : blueColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    );
                  },
                ),
              ),
        isLoading
            ? const Expanded(child: ShimmerView())
            : Expanded(
                child: subServiceList == null
                    ? const Center(
                        child: Text("No Catelog Found"),
                      )
                    : Container(
                        color: whiteColor,
                        padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
                        child: ListView.builder(
                          itemCount: subServiceList?.length,
                          itemBuilder: (context, index) {
                            GetSubServiceByServiceIdModel subitem = subServiceList![index];

                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                child: SizedBox(
                                  height: height / 4.5,
                                  child: Column(
                                    children: [
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
                                                        subitem.serviceName ?? '',
                                                        maxLines: 2,
                                                        style:
                                                            const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      "₹${subitem.servicePrice}",
                                                      maxLines: 1,
                                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "₹4,500",
                                                          style: TextStyle(
                                                              decoration: TextDecoration.lineThrough,
                                                              color: greyColor,
                                                              fontSize: 18),
                                                        ),
                                                        const SizedBox(width: 2),
                                                        Card(
                                                          margin: const EdgeInsets.all(0),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20)),
                                                          color: greenColor,
                                                          child: Container(
                                                              alignment: Alignment.center,
                                                              padding: const EdgeInsets.all(8),
                                                              child: const Text(
                                                                "Save 40%",
                                                                style: TextStyle(
                                                                    color: whiteColor,
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.w500),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 6),
                                                    SizedBox(
                                                      height: 20,
                                                      child: Text(
                                                        subitem.description ?? "",
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                    const Text(
                                                      "See Details!",
                                                      style: TextStyle(
                                                          decoration: TextDecoration.underline,
                                                          decorationStyle: TextDecorationStyle.dotted,
                                                          color: blueColor),
                                                    ),
                                                    const SizedBox(height: 4)
                                                  ],
                                                ),
                                              )),
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              height: 140,
                                              child: Stack(
                                                children: [
                                                  subitem.image == null
                                                      ? SizedBox(
                                                          height: 120,
                                                          width: 120,
                                                          child: Image.asset('assets/Images/Image_gallery.png'))
                                                      : Container(
                                                          height: 120,
                                                          width: 120,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                subitem.image ?? "",
                                                              )),
                                                              borderRadius: const BorderRadius.all(
                                                                Radius.circular(15),
                                                              )),
                                                        ),
                                                  Positioned(
                                                      top: -2,
                                                      left: 25,
                                                      child: Image.asset(
                                                        Images.bestSellerimg,
                                                        scale: 4,
                                                      )),
                                                  Positioned(
                                                      bottom: 0,
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                                        child: Container(
                                                          height: 40,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                            color: lightBackGroundColor,
                                                            border: Border.all(width: 1, color: blueColor),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: subitem.count == 0
                                                              ? GestureDetector(
                                                                  onTap: () async {
                                                                    Data addToCartView = await ApiHelpers()
                                                                        .addToCartButton(
                                                                            api: addTocartButton +
                                                                                subitem.subServiceId.toString());
                                                                    showCategoryBottomSheet(
                                                                        addToCartView, subitem.count ?? 0);
                                                                  },
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Spacer(),
                                                                      Text(
                                                                        "Add",
                                                                        style: TextStyle(color: blueColor),
                                                                      ),
                                                                      Spacer(),
                                                                      Container(
                                                                        height: 40,
                                                                        width: 1,
                                                                        color: blueColor,
                                                                      ),
                                                                      Spacer(),
                                                                      Icon(
                                                                        Icons.add,
                                                                        color: blueColor,
                                                                      ),
                                                                      Spacer(),
                                                                    ],
                                                                  ),
                                                                )
                                                              : Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                      Spacer(),
                                                                      InkWell(
                                                                          onTap: () async {
                                                                            SharedPreferences prefs =
                                                                                await SharedPreferences.getInstance();
                                                                            var userId = prefs.getInt('userId');
                                                                            Map<String, dynamic> params = {
                                                                              "customer_user_id": userId.toString(),
                                                                              "provider_user_id": widget
                                                                                  .getServiceUserData.userId
                                                                                  .toString(),
                                                                              "sub_service_id":
                                                                                  subitem.subServiceId?.toString()
                                                                            };
                                                                            Map minus =
                                                                                await ApiHelpers().postAddToCart(
                                                                              addToCartMinusButton,
                                                                              params,
                                                                            );
                                                                            debugPrint(minus.toString());
                                                                            if (minus['status'] == 200) {
                                                                              fetchSubServiceByServiceId(
                                                                                  serviceID:
                                                                                      selectedSubService!.serviceId);
                                                                            }
                                                                            setState(() {});
                                                                          },
                                                                          child: Icon(Icons.remove)),
                                                                      Spacer(),
                                                                      Text(
                                                                        subitem.count.toString(),
                                                                        style: TextStyle(
                                                                            fontSize: 18, fontWeight: FontWeight.w600),
                                                                      ),
                                                                      Spacer(),
                                                                      InkWell(
                                                                          onTap: () async {
                                                                            Data addToCartView = await ApiHelpers()
                                                                                .addToCartButton(
                                                                                    api: addTocartButton +
                                                                                        subitem.subServiceId
                                                                                            .toString());
                                                                            showCategoryBottomSheet(
                                                                                addToCartView, subitem.count ?? 0);
                                                                          },
                                                                          child: Icon(Icons.add)),
                                                                      Spacer(),
                                                                    ]),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: lightblue,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(15),
                                                bottomRight: Radius.circular(15),
                                              )),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 20),
                                              Image.asset(Images.bagImageView, scale: 4),
                                              const SizedBox(width: 10),
                                              const Text(
                                                "16 Times Booked in last 30 days",
                                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                                              ),
                                              const Spacer(),
                                              const Icon(Icons.share, size: 18, color: blueColor),
                                              const SizedBox(width: 5),
                                              const Text(
                                                "Share",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500, fontSize: 15, color: blueColor),
                                              ),
                                              const SizedBox(width: 8),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
      ],
    );
  }

  showCategoryBottomSheet(Data addToCartView, int count) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
        builder: (BuildContext bc) {
          return CatBottomSheet(
            addToCartView: addToCartView,
            count: count,
          );
        }).then((value) {
      fetchSubServiceByServiceId(serviceID: selectedSubService!.serviceId);

      setState(() {});
    });
  }
}
