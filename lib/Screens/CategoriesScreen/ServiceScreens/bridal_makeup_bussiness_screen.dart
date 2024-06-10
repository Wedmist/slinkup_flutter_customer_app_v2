import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/BottonSheets/birdal_makeup_profile_tile.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/book_an_appointment_screen.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Utils/Images.dart';

import '../../../Utils/constants.dart';
import '../../Reviews/customer_reviews_screen.dart';
import '../../RewardsScreen/GalleryScreens/gallery_image_tile.dart';
import 'BottonSheets/birdal_makeup_call_category.dart';

class BirdalMakeupBussinessScreen extends StatefulWidget {
  const BirdalMakeupBussinessScreen({Key? key}) : super(key: key);

  @override
  State<BirdalMakeupBussinessScreen> createState() =>
      _BirdalMakeupBussinessScreenState();
}

class _BirdalMakeupBussinessScreenState
    extends State<BirdalMakeupBussinessScreen> {
  List<String> serviceList = [
    "HD Bridal Makeup",
    "HD Bridal Makeup",
    "HD Bridal Makeup",
    "HD Bridal Makeup",
    "HD Bridal Makeup"
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: whiteColor,
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
              "Bridal Makeup",
              style: TextStyle(color: whiteColor),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BirdalMakeUpProfileTile(
                      title: "",
                    ),
                    const SizedBox(height: 5),
                    const Divider(height: 1, color: greyColor),
                    const BirdalMakeupCallCategory(),
                    Container(height: 6, color: lightBackGroundColor),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleString(
                              title: "Business Overview", fontSize: 15),
                          const SizedBox(height: 5),
                          RichText(
                            text: const TextSpan(
                              text: 'About the Business : ',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'We have been in this business for the past 4 years and are largely recognized and appreciated for our best and reliable products. We assure the quality of the products and impeccable service to all our customers.',
                                    style: TextStyle(
                                        color: greyColor,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: const TextSpan(
                              text: 'Age of Business: ',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '4 years 7 Months',
                                    style: TextStyle(
                                        color: greyColor,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(height: 6, color: lightBackGroundColor),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleString(
                                title: "Available Coupons", fontSize: 14),
                            const SizedBox(height: 10),
                            Expanded(
                                child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 5,
                                  child: SizedBox(
                                      height: 35,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 5),
                                          Image.asset(Images.coupon, scale: 3),
                                          const SizedBox(width: 5),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              TitleString(
                                                  title: "Flat 15% off",
                                                  fontSize: 13),
                                              SizedBox(height: 2),
                                              Text(
                                                "Use FIRSTGO  |  Above 600",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: greyColor),
                                              )
                                            ],
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                      )),
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: blueColor)),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "See all Coupons",
                          style: TextStyle(color: blueColor),
                        ),
                      ),
                    ),
                    Container(height: 6, color: lightBackGroundColor),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TitleString(
                          title: "Certificates & Awards", fontSize: 14),
                    ),
                    SizedBox(
                      height: 165,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleString(
                                title: "Available Coupons", fontSize: 14),
                            const SizedBox(height: 10),
                            Expanded(
                                child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 4),
                                  child: Container(
                                    width: 130,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                            image:
                                                AssetImage(Images.networkImage),
                                            fit: BoxFit.fill)),
                                  ),
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: blueColor)),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "See all Certificates",
                          style: TextStyle(color: blueColor),
                        ),
                      ),
                    ),
                    Container(height: 6, color: lightBackGroundColor),
                    SizedBox(
                      height: 170,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleString(
                                title: "Albums (6)", fontSize: 14),
                            const SizedBox(height: 10),
                            Expanded(
                                child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return const SizedBox(
                                    height: 80,
                                    width: 140,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 4, right: 4),
                                      child: GalleryImageTile(),
                                    ));
                              },
                            )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: blueColor)),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "See all Certificates",
                          style: TextStyle(color: blueColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: height / 5,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          itemCount: serviceList.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 180,
                                  childAspectRatio: 3 / 0.7,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10),
                          shrinkWrap: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: lightblue,
                                ),
                                child:
                                    Text("${serviceList[index]} ${index + 1}"));
                          },
                        ),
                      ),
                    ),
                    Container(height: 6, color: lightBackGroundColor),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 8),
                      child: SizedBox(
                        height: 60,
                        child: TitleString(
                            title: "See What Customers says about our Service",
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: height,
                          child: const CustomerReviewsScreen(
                            physics: NeverScrollableScrollPhysics(),
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BookAnAppointMentScreen()));
                      },
                      child: Container(
                        color: blueColor,
                        alignment: Alignment.center,
                        width: width - 15,
                        height: 40,
                        child: const Text(
                          "Book an Appointment",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
