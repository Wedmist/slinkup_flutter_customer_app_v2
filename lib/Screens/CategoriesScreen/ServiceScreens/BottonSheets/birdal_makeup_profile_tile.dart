import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Model/get_sub_services_provider_detailsa_model.dart';

import '../../../../Utils/Images.dart';
import '../../../../Utils/constants.dart';
import '../../../HomeScreen/Components/carousel_slider_image.dart';

class BirdalMakeUpProfileTile extends StatelessWidget {
  const BirdalMakeUpProfileTile({Key? key, this.getServiceUserData, required this.title, this.serviceArea})
      : super(key: key);
  final GetServiceUserDataModel? getServiceUserData;
  final String title;
  final String? serviceArea;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          color: whiteColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TitleString(title: title, fontSize: 16),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: width / 2, child: TitleString(title: title, fontSize: 16)),
                            Image.asset(
                              Images.rightIconBanner,
                              scale: 3,
                            ),
                            Image.asset(
                              Images.filterIconI,
                              scale: 3,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: redColor,
                              size: 18,
                            ),
                            SizedBox(width: 2),
                            Text("Patrapada, Bhubaneswar . 4km")
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: SizedBox(
                                width: 80,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                          color: GetlightblueColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          )),
                                      child: const Text(
                                        "Experience",
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      padding: const EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: greyLightColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          )),
                                      child: const Text(
                                        "4*",
                                        style: TextStyle(color: blackColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: SizedBox(
                                width: 70,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, right: 8, top: 5, bottom: 5),
                                      decoration: const BoxDecoration(
                                          color: GetlightblueColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          )),
                                      child: const Text(
                                        "Q-Score",
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ),
                                    Container(
                                      width: 70,
                                      padding: const EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: greyLightColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          )),
                                      child: const Text(
                                        "8.4",
                                        style: TextStyle(color: blackColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              child: SizedBox(
                                width: 70,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 8),
                                      decoration: const BoxDecoration(
                                          color: GetlightblueColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          )),
                                      child: const Text(
                                        "HIRED",
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: greyLightColor,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          )),
                                      child: const Text(
                                        "29 Times",
                                        style: TextStyle(fontSize: 12, color: blackColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(fit: BoxFit.fill, image: AssetImage(Images.networkImage)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: SizedBox(
                          width: 70,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 21, right: 21, top: 5, bottom: 5),
                                decoration: const BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    )),
                                child: const Text(
                                  "49 *",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                              Container(
                                width: 70,
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                )),
                                child: const Text(
                                  "(24)",
                                  style: TextStyle(color: blackColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: whiteColor,
          child: Row(
            children: [
              Image.asset(
                Images.house,
                scale: 3,
              ),
              const SizedBox(width: 5),
              TitleString(title: serviceArea ?? "Doorstep Service  |  7 am to 9 pm", fontSize: 15)
            ],
          ),
        ),
        Container(color: whiteColor, height: 10),
        const SizedBox(
          height: 0.005,
        ),
      ],
    );
  }
}
