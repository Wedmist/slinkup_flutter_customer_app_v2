import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';
import 'package:flutter_customer_app/Screens/RewardsScreen/GalleryScreens/gallery_image_tile.dart';
import 'package:flutter_customer_app/Screens/RewardsScreen/GalleryScreens/gallery_tab_view.dart';
import 'package:flutter_customer_app/Utils/constants.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int selectedCatIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            title: const Text("Gallery"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(10),
                child: TitleString(title: "See Raveena’s Albums (6)", fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 100,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120, childAspectRatio: 3 / 1, crossAxisSpacing: 20, mainAxisSpacing: 10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedCatIndex = index;
                          setState(() {});
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: selectedCatIndex == index ? blueColor : lightBackGroundColor,
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: Text(
                              "Service $index",
                              style: TextStyle(
                                  color: selectedCatIndex == index ? whiteColor : blueColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, childAspectRatio: 3 / 3.3, crossAxisSpacing: 15, mainAxisSpacing: 15),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 16,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const GalleryTabView()));
                        },
                        child: const GalleryImageTile());
                  },
                ),
              )
            ],
          )),
    );
  }
}
