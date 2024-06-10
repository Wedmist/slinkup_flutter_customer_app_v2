import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Utils/Images.dart';

import '../../../Utils/constants.dart';

class GalleryTabView extends StatefulWidget {
  const GalleryTabView({Key? key})
      : super(key: key);

  @override
  State<GalleryTabView> createState() =>
      _GalleryTabViewState();
}

class _GalleryTabViewState
    extends State<GalleryTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: blackColor,
              )),
          title: const Text(
            "Radhika’s Wedding",
            style: TextStyle(color: blackColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]
              TabBar(
                controller: _tabController,
                indicatorColor: blueColor,
                labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                labelColor: blueColor,
                unselectedLabelColor: greyColor,
                tabs: const [
                  Tab(
                    text: 'Photos',
                  ),
                  Tab(
                    text: 'Videos',
                  ),
                ],
              ),
              const Divider(
                  height: 1, color: blackColor),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  200,
                              childAspectRatio:
                                  3 / 3.3,
                              crossAxisSpacing:
                                  15,
                              mainAxisSpacing:
                                  15),
                      physics:
                          const BouncingScrollPhysics(),
                      itemCount: 16,
                      shrinkWrap: true,
                      padding:
                          const EdgeInsets.all(
                              15),
                      scrollDirection:
                          Axis.vertical,
                      itemBuilder:
                          (context, index) {
                        return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder:
                              //             (context) =>
                              //                 const GalleryTabView()));
                            },
                            child: Container(
                              decoration:
                                  const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit
                                        .fill,
                                    image: AssetImage(
                                        Images
                                            .networkImage)),
                              ),
                              alignment: Alignment
                                  .center,
                            ));
                      },
                    ),
                    const Center(
                      child: Text(
                        'Videos',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
