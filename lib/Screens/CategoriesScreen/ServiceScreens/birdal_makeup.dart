import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/bridal_makeup_profile.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:flutter_customer_app/Utils/constants.dart';

import '../../../Apis/api_constants.dart';
import '../../../Apis/api_helper.dart';
import '../../../Model/get_similar_service_by_id_model.dart';
import '../../../Utils/shimmer.dart';

class BirdalMakeUp extends StatefulWidget {
  final int? catId;
  final int? servicesId;
  const BirdalMakeUp({Key? key, this.catId, this.servicesId}) : super(key: key);

  @override
  State<BirdalMakeUp> createState() => _BirdalMakeUpState();
}

class _BirdalMakeUpState extends State<BirdalMakeUp> {
  List<GetSimilarService>? getSimilarServiceList;
  bool isLoading = false;
  @override
  void initState() {
    getServicesById();
    // TODO: implement initState
    super.initState();
  }

  getServicesById() async {
    setState(() {
      isLoading = true;
    });
    getSimilarServiceList =
        await ApiHelpers().fetchSimilarServiceID(api: getSimilarServicesById + widget.servicesId.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 18),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: width / 1.28,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: greyColor,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        "Search Birdal Makeup",
                        style: TextStyle(color: GetLightGreyColor),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        Images.filter,
                        scale: 4.0,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("26 Professional Experts for you"),
              ),
              isLoading
                  ? const Expanded(child: ShimmerView())
                  : getSimilarServiceList == null
                      ? const SizedBox()
                      : Expanded(
                          child: Container(
                              color: backgroundColor,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: getSimilarServiceList?.length,
                                itemBuilder: (context, index) {
                                  GetSimilarService? similarServices = getSimilarServiceList?[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BridalMakeupProfile(
                                              title:
                                                  "${similarServices.serviceName} by ${similarServices.subServiceDetails?.first.name}",
                                              serviceArea: similarServices.subServiceDetails?.first.serviceArea,
                                              serviceId: similarServices.serviceId ?? 0,
                                              serviceUserId: similarServices.userId ?? 0,
                                              categoryId: similarServices.categoryId ?? 0,
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      elevation: 0,
                                      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 15),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      child: SizedBox(
                                        height: height / 3,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          "https://dl.fujifilm-x.com/global/products/cameras/x-t3/sample-images/ff_x_t3_002.JPG")),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                                              height: height / 5,
                                              width: width,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(height: 5),
                                                      TitleString(
                                                          title:
                                                              "${similarServices!.serviceName} by ${similarServices.subServiceDetails?.first.name}",
                                                          fontSize: 12),
                                                      const SizedBox(height: 8),
                                                      const Row(
                                                        children: [
                                                          Icon(Icons.location_on_rounded, size: 12),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            "CRPF, Bhubaneswar",
                                                            style: TextStyle(fontSize: 12),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Row(
                                                        children: [
                                                          Image.asset(Images.arrowRight, scale: 5),
                                                          const SizedBox(width: 5),
                                                          Image.asset(Images.house, scale: 4),
                                                          const SizedBox(width: 5),
                                                          Text(
                                                            "${similarServices.subServiceDetails?.first.serviceArea}",
                                                            style: const TextStyle(
                                                                fontSize: 11, fontWeight: FontWeight.bold),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    const SizedBox(height: 2),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          alignment: Alignment.center,
                                                          height: 28,
                                                          width: 45,
                                                          decoration: BoxDecoration(
                                                              color: greenColor,
                                                              borderRadius: BorderRadius.circular(5)),
                                                          child: const Text(
                                                            "5.0 *",
                                                            style: TextStyle(
                                                                color: whiteColor,
                                                                fontSize: 13,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5),
                                                        const Text("(25)"),
                                                        const SizedBox(width: 5),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 10),
                                                      child: Text(
                                                        "₹${similarServices.subServiceDetails?.first.minPrice} - ₹${similarServices.subServiceDetails?.first.maxPrice}",
                                                        style:
                                                            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                                      ),
                                                    )
                                                  ],
                                                ))
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
                                                    Image.asset(Images.coupon, scale: 4),
                                                    const SizedBox(width: 10),
                                                    const Text(
                                                      "2 Coupons available",
                                                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ),
            ],
          )),
    );
  }
}
