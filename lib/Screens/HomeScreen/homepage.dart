// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Model/home_screen_data_model.dart';
import 'package:flutter_customer_app/Screens/Location/location_dialog.dart';
import 'package:flutter_customer_app/Screens/MyProfileScreen/my_profile_screen.dart';
import 'package:flutter_customer_app/Screens/SplashScreen/splash_screen.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:flutter_customer_app/Utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Apis/api_constants.dart';
import '../../Model/get_all_categories_model.dart';
import '../CategoriesScreen/ServiceScreens/service_screen.dart';
import 'Components/carousel_slider_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPos = 0;
  List<HomeScreenListModel>? homeScreenList;
  List<GetAllCatModel>? getAllCategoires;
  List<String> listPaths = [
    Images.getDummyImage,
    Images.getDummyImage,
    Images.getDummyImage,
    Images.getDummyImage,
    Images.getDummyImage,
  ];
  @override
  void initState() {
    getAllcat();
    getHomeScreenDataView();
    // TODO: implement initState
    super.initState();
  }

  getAllcat() async {
    getAllCategoires = await ApiHelpers().fetchAllCategoriesData(api: getAllCategories);
    setState(() {});
  }

  getHomeScreenDataView() async {
    homeScreenList = await ApiHelpers().fetchHomeScreenData(api: getHomeScreenData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constrants) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: primaryColor,
                  height: height / 6,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () async {
                                  SharedPreferences preferences = await SharedPreferences.getInstance();
                                  await preferences.clear();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Splash()));
                                },
                                child: Image.asset(
                                  Images.slinkupImg,
                                  scale: 60,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile()));
                                },
                                child: Image.asset(IconsView.filterMenuIcon, scale: 2.8),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: width / 1.15,
                          height: height / 18,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                  color: whiteColor, //New
                                  blurRadius: 0.1,
                                  offset: Offset(0, 1))
                            ],
                          ),
                          child: const Text(
                            "Search for any service",
                            style: TextStyle(color: GetLightGreyColor, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    locationBottonSheet();
                  },
                  child: Container(
                    height: 30,
                    color: mapColor,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.location_on_rounded,
                          color: whiteColor,
                          size: 16,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: width / 1.21,
                          child: const Text(
                            "Select location",
                            // "hyderabad,madhapur,ayyapa society,500032",
                            style: TextStyle(color: whiteColor, fontSize: 13),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: whiteColor,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                ),
                CarouselSlider.builder(
                  itemCount: listPaths.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      height: height / 4.5,
                      onPageChanged: (index, reason) {
                        currentPos = index;
                        setState(() {});
                      }),
                  itemBuilder: (context, index, realIndex) {
                    return SizedBox(
                      width: width,
                      child: MyImageView(listPaths[index]),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listPaths.map((url) {
                    int index = listPaths.indexOf(url);
                    return Container(
                      width: 20.0,
                      height: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: currentPos == index ? blueColor : backgroundColor,
                      ),
                    );
                  }).toList(),
                ),
                const Padding(
                  padding: EdgeInsets.all(18),
                  child: TitleString(fontSize: 20, title: "Book From our Top Categories"),
                ),

                /// list.generate
                getAllCategoires == null
                    ? const SizedBox()
                    : GridView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: getAllCategoires?.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          GetAllCatModel? getAllCat = getAllCategoires?[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceScreen(workcatId: getAllCat!.workCategoryId!),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(
                                    color: blackColor,
                                    width: 0.4,
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        image: getAllCat?.image == null
                                            ? null
                                            : DecorationImage(image: NetworkImage(getAllCat?.image ?? ""))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      getAllCat?.category ?? "",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                Container(height: 5, color: backgroundColor),

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
                  child: Container(
                    width: width,
                    height: height / 6,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),

                //// categories

                homeScreenList == null
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeScreenList?.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          HomeScreenListModel homeScreen = homeScreenList![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(18.0),
                                    child: TitleString(fontSize: 18, title: homeScreen.categoryName),
                                  ),
                                  const Spacer(),
                                  index.isEven
                                      ? InkWell(
                                          onTap: () {
                                            showDialogview();
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => const BirdalMakeupBussinessScreen()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: buttonColor, borderRadius: BorderRadius.circular(6)),
                                              padding: const EdgeInsets.all(12),
                                              child: const Text(
                                                "View all",
                                                style: TextStyle(
                                                    color: whiteColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    fontFamily: "Roboto"),
                                              )),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              index.isEven
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 18, right: 8, top: 15),
                                      child: SizedBox(
                                        height: height / 3,
                                        child: GridView.builder(
                                            padding: const EdgeInsets.all(0),
                                            physics: const NeverScrollableScrollPhysics(),
                                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                childAspectRatio: 3 / 2,
                                                crossAxisSpacing: 20,
                                                mainAxisSpacing: 10),
                                            itemCount: homeScreen.categoryServices.length,
                                            itemBuilder: (BuildContext ctx, index) {
                                              CategoryService catServices = homeScreen.categoryServices[index];
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  catServices.image == null
                                                      ? SizedBox(
                                                          height: height / 9,
                                                          child: Image.asset('assets/Images/Image_gallery.png'))
                                                      : Container(
                                                          height: height / 9,
                                                          alignment: Alignment.center,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(catServices.image ?? '')),
                                                              color: Colors.amber,
                                                              borderRadius: BorderRadius.circular(5)),
                                                        ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
                                                      child: Text(
                                                        catServices.serviceName ?? '',
                                                        style: const TextStyle(
                                                            color: blackColor,
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 16,
                                                            fontFamily: "Roboto"),
                                                      )),
                                                ],
                                              );
                                            }),
                                      ),
                                    )
                                  : SizedBox(
                                      height: height / 5,
                                      child: ListView.builder(
                                          itemCount: homeScreen.categoryServices.length,
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            CategoryService catServices = homeScreen.categoryServices[index];
                                            return Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  catServices.image == null
                                                      ? SizedBox(
                                                          width: 140,
                                                          height: 110,
                                                          child: Image.asset('assets/Images/Image_gallery.png'))
                                                      : Container(
                                                          width: 140,
                                                          height: 110,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(catServices.image ?? '')),
                                                              color: Colors.green,
                                                              borderRadius: BorderRadius.circular(6)),
                                                        ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8, top: 5),
                                                    child: Text(
                                                      catServices.serviceName ?? "",
                                                      style: const TextStyle(
                                                          color: blackColor,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 15,
                                                          fontFamily: "Roboto"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                              index.isEven
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        showDialogview();
                                        // Navigator.push(
                                        //     context, MaterialPageRoute(builder: (context) => const ReviewScreen()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
                                        child: Container(
                                          width: width,
                                          height: height / 15,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: buttonColor, borderRadius: BorderRadius.circular(10)),
                                          child: const Text(
                                            "View all",
                                            style: TextStyle(fontSize: 19, color: whiteColor),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          );
                        },
                      )

                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: TitleString(fontSize: 18, title: "Home Salon"),
                // ),
                // const Padding(
                //     padding: EdgeInsets.only(left: 8, right: 8),
                //     child: Text(
                //       "We Stand in your Business",
                //       style: TextStyle(
                //           color: blackColor,
                //           fontWeight: FontWeight.w400,
                //           fontSize: 16,
                //           fontFamily: "Roboto"),
                //     )),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                //   child: SizedBox(
                //     height: height / 3,
                //     child: GridView.builder(
                //         padding: const EdgeInsets.all(0),
                //         physics: const NeverScrollableScrollPhysics(),
                //         gridDelegate:
                //             const SliverGridDelegateWithMaxCrossAxisExtent(
                //                 maxCrossAxisExtent: 200,
                //                 childAspectRatio: 3 / 2,
                //                 crossAxisSpacing: 20,
                //                 mainAxisSpacing: 10),
                //         itemCount: 4,
                //         itemBuilder: (BuildContext ctx, index) {
                //           return Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Container(
                //                 height: height / 9,
                //                 alignment: Alignment.center,
                //                 decoration: BoxDecoration(
                //                     color: Colors.amber,
                //                     borderRadius: BorderRadius.circular(5)),
                //               ),
                //               const Padding(
                //                   padding:
                //                       EdgeInsets.only(left: 4, right: 4, top: 4),
                //                   child: Text(
                //                     "We Stand in your ",
                //                     style: TextStyle(
                //                         color: blackColor,
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 16,
                //                         fontFamily: "Roboto"),
                //                   )),
                //             ],
                //           );
                //         }),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const ReviewScreen()));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
                //     child: Container(
                //       width: width,
                //       height: height / 15,
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //           color: buttonColor,
                //           borderRadius: BorderRadius.circular(10)),
                //       child: const Text(
                //         "View all",
                //         style: TextStyle(fontSize: 19, color: whiteColor),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(height: 5, color: backgroundColor),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: const [
                //           TitleString(title: "Category 2", fontSize: 18),
                //           SizedBox(height: 2),
                //           Text(
                //             "Category 2 Description",
                //             style: TextStyle(
                //                 color: blackColor,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 fontFamily: "Roboto"),
                //           ),
                //         ],
                //       ),
                //       const Spacer(),
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) =>
                //                       const BirdalMakeupBussinessScreen()));
                //         },
                //         child: Container(
                //             decoration: BoxDecoration(
                //                 color: buttonColor,
                //                 borderRadius: BorderRadius.circular(6)),
                //             padding: const EdgeInsets.all(12),
                //             child: const Text(
                //               "View all",
                //               style: TextStyle(
                //                   color: whiteColor,
                //                   fontWeight: FontWeight.w400,
                //                   fontSize: 16,
                //                   fontFamily: "Roboto"),
                //             )),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: height / 5,
                //   child: ListView.builder(
                //       itemCount: 8,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 width: 140,
                //                 height: 120,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(6)),
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.only(left: 8, top: 5),
                //                 child: Text(
                //                   "Cat item",
                //                   style: TextStyle(
                //                       color: blackColor,
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 15,
                //                       fontFamily: "Roboto"),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         );
                //       }),
                // ),
                // Container(height: 5, color: backgroundColor),

/////
                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: TitleString(
                //       fontSize: 18, title: "Technical & Repair Services"),
                // ),
                // const Padding(
                //     padding: EdgeInsets.only(left: 8, right: 8),
                //     child: Text(
                //       "We Stand in your Business",
                //       style: TextStyle(
                //           color: blackColor,
                //           fontWeight: FontWeight.w400,
                //           fontSize: 16,
                //           fontFamily: "Roboto"),
                //     )),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                //   child: SizedBox(
                //     height: height / 2.9,
                //     child: GridView.builder(
                //         padding: const EdgeInsets.all(0),
                //         physics: const NeverScrollableScrollPhysics(),
                //         gridDelegate:
                //             const SliverGridDelegateWithMaxCrossAxisExtent(
                //                 maxCrossAxisExtent: 200,
                //                 childAspectRatio: 3 / 2,
                //                 crossAxisSpacing: 20,
                //                 mainAxisSpacing: 10),
                //         itemCount: 4,
                //         itemBuilder: (BuildContext ctx, index) {
                //           return Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Container(
                //                 height: height / 9,
                //                 alignment: Alignment.center,
                //                 decoration: BoxDecoration(
                //                     color: Colors.amber,
                //                     borderRadius: BorderRadius.circular(5)),
                //               ),
                //               const Padding(
                //                   padding:
                //                       EdgeInsets.only(left: 4, right: 4, top: 4),
                //                   child: Text(
                //                     "We Stand in your ",
                //                     style: TextStyle(
                //                         color: blackColor,
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 16,
                //                         fontFamily: "Roboto"),
                //                   )),
                //             ],
                //           );
                //         }),
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
                //   child: Container(
                //     width: width,
                //     height: height / 15,
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: buttonColor,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: const Text(
                //       "View all",
                //       style: TextStyle(fontSize: 19, color: whiteColor),
                //     ),
                //   ),
                // ),
                // Container(
                //   color: backgroundColor,
                //   height: height / 5.5,
                //   alignment: Alignment.center,
                //   child: const Text("Banner"),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: const [
                //           TitleString(title: "Category 4", fontSize: 18),
                //           SizedBox(height: 2),
                //           Text(
                //             "Category 4 Description",
                //             style: TextStyle(
                //                 color: blackColor,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 fontFamily: "Roboto"),
                //           ),
                //         ],
                //       ),
                //       const Spacer(),
                //       Container(
                //           decoration: BoxDecoration(
                //               color: buttonColor,
                //               borderRadius: BorderRadius.circular(6)),
                //           padding: const EdgeInsets.all(12),
                //           child: const Text(
                //             "View all",
                //             style: TextStyle(
                //                 color: whiteColor,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 fontFamily: "Roboto"),
                //           ))
                //     ],
                //   ),
                // ),

                // SizedBox(
                //   height: height / 5,
                //   child: ListView.builder(
                //       itemCount: 8,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 width: 140,
                //                 height: 120,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(6)),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 8, top: 5),
                //                 child: Text(
                //                   "Service $index",
                //                   style: const TextStyle(
                //                       color: blackColor,
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 15,
                //                       fontFamily: "Roboto"),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         );
                //       }),
                // ),

                // Container(height: 5, color: backgroundColor),
                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child:
                //       TitleString(fontSize: 18, title: "Cleaning & Sanitization"),
                // ),
                // const Padding(
                //     padding: EdgeInsets.only(left: 8, right: 8),
                //     child: Text(
                //       "We Stand in your Business",
                //       style: TextStyle(
                //           color: blackColor,
                //           fontWeight: FontWeight.w400,
                //           fontSize: 16,
                //           fontFamily: "Roboto"),
                //     )),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                //   child: SizedBox(
                //     height: height / 2.9,
                //     child: GridView.builder(
                //         padding: const EdgeInsets.all(0),
                //         physics: const NeverScrollableScrollPhysics(),
                //         gridDelegate:
                //             const SliverGridDelegateWithMaxCrossAxisExtent(
                //                 maxCrossAxisExtent: 200,
                //                 childAspectRatio: 3 / 2,
                //                 crossAxisSpacing: 20,
                //                 mainAxisSpacing: 10),
                //         itemCount: 4,
                //         itemBuilder: (BuildContext ctx, index) {
                //           return Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Container(
                //                 height: height / 9,
                //                 alignment: Alignment.center,
                //                 decoration: BoxDecoration(
                //                     color: Colors.amber,
                //                     borderRadius: BorderRadius.circular(5)),
                //               ),
                //               const Padding(
                //                   padding:
                //                       EdgeInsets.only(left: 4, right: 4, top: 4),
                //                   child: Text(
                //                     "We Stand in your ",
                //                     style: TextStyle(
                //                         color: blackColor,
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 16,
                //                         fontFamily: "Roboto"),
                //                   )),
                //             ],
                //           );
                //         }),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
                //   child: Container(
                //     width: width,
                //     height: height / 15,
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: buttonColor,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: const Text(
                //       "View all",
                //       style: TextStyle(fontSize: 19, color: whiteColor),
                //     ),
                //   ),
                // ),
                // Container(height: 5, color: backgroundColor),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: const [
                //           TitleString(title: "Category 6", fontSize: 18),
                //           SizedBox(height: 2),
                //           Text(
                //             "Category 6 Description",
                //             style: TextStyle(
                //                 color: blackColor,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 fontFamily: "Roboto"),
                //           ),
                //         ],
                //       ),
                //       const Spacer(),
                //       Container(
                //           decoration: BoxDecoration(
                //               color: buttonColor,
                //               borderRadius: BorderRadius.circular(6)),
                //           padding: const EdgeInsets.all(12),
                //           child: const Text(
                //             "View all",
                //             style: TextStyle(
                //                 color: whiteColor,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 fontFamily: "Roboto"),
                //           ))
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: height / 5,
                //   child: ListView.builder(
                //       itemCount: 8,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 width: 140,
                //                 height: 120,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(6)),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 8, top: 5),
                //                 child: Text(
                //                   "Service $index",
                //                   style: const TextStyle(
                //                       color: blackColor,
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 15,
                //                       fontFamily: "Roboto"),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         );
                //       }),
                // ),
                // Container(
                //   color: backgroundColor,
                //   height: height / 5.5,
                //   alignment: Alignment.center,
                //   child: const Text("Banner"),
                // ),

                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: TitleString(fontSize: 18, title: "Category 7"),
                // ),
                // const Padding(
                //     padding: EdgeInsets.only(left: 8, right: 8),
                //     child: Text(
                //       "We Stand in your Business",
                //       style: TextStyle(
                //           color: blackColor,
                //           fontWeight: FontWeight.w400,
                //           fontSize: 16,
                //           fontFamily: "Roboto"),
                //     )),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                //   child: SizedBox(
                //     height: height / 2.9,
                //     child: GridView.builder(
                //         padding: const EdgeInsets.all(0),
                //         physics: const NeverScrollableScrollPhysics(),
                //         gridDelegate:
                //             const SliverGridDelegateWithMaxCrossAxisExtent(
                //                 maxCrossAxisExtent: 200,
                //                 childAspectRatio: 3 / 2,
                //                 crossAxisSpacing: 20,
                //                 mainAxisSpacing: 10),
                //         itemCount: 4,
                //         itemBuilder: (BuildContext ctx, index) {
                //           return Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               Container(
                //                 height: height / 9,
                //                 alignment: Alignment.center,
                //                 decoration: BoxDecoration(
                //                     color: Colors.amber,
                //                     borderRadius: BorderRadius.circular(5)),
                //               ),
                //               const Padding(
                //                   padding:
                //                       EdgeInsets.only(left: 4, right: 4, top: 4),
                //                   child: Text(
                //                     "We Stand in your ",
                //                     style: TextStyle(
                //                         color: blackColor,
                //                         fontWeight: FontWeight.w400,
                //                         fontSize: 16,
                //                         fontFamily: "Roboto"),
                //                   )),
                //             ],
                //           );
                //         }),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
                //   child: Container(
                //     width: width,
                //     height: height / 15,
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: buttonColor,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: const Text(
                //       "View all",
                //       style: TextStyle(fontSize: 19, color: whiteColor),
                //     ),
                //   ),
                // ),
                // Container(height: 5, color: backgroundColor),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: const [
                //           TitleString(title: "Category 8", fontSize: 18),
                //           SizedBox(height: 2),
                //           Text(
                //             "Category 8 Description",
                //             style: TextStyle(
                //                 color: blackColor,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 fontFamily: "Roboto"),
                //           ),
                //         ],
                //       ),
                //       const Spacer(),
                //       Container(
                //           decoration: BoxDecoration(
                //               color: buttonColor,
                //               borderRadius: BorderRadius.circular(6)),
                //           padding: const EdgeInsets.all(12),
                //           child: const Text(
                //             "View all",
                //             style: TextStyle(
                //                 color: whiteColor,
                //                 fontWeight: FontWeight.w400,
                //                 fontSize: 16,
                //                 fontFamily: "Roboto"),
                //           ))
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: height / 5,
                //   child: ListView.builder(
                //       itemCount: 8,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 width: 140,
                //                 height: 120,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     borderRadius: BorderRadius.circular(6)),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 8, top: 5),
                //                 child: Text(
                //                   "Service $index",
                //                   style: const TextStyle(
                //                       color: blackColor,
                //                       fontWeight: FontWeight.w500,
                //                       fontSize: 15,
                //                       fontFamily: "Roboto"),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         );
                //       }),
                // ),
                // SizedBox(height: 10)
              ],
            );
          }),
        ),
      ),
    );
  }

  void showDialogview() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text(
          'Still Wait for Next Version',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  void locationBottonSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return const LocationDialogView();
        });
  }
}
