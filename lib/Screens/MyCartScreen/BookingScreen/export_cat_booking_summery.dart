import 'package:flutter/material.dart';

import '../../../Model/get_sub_services_provider_detailsa_model.dart';
import '../../../Utils/constants.dart';
import '../../CategoriesScreen/ServiceScreens/explore_cat_scree.dart';

class ExportCatBookSummery extends StatelessWidget {
  const ExportCatBookSummery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            title: const Text("Booking Summary"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                children: [
                  Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      width: width / 2,
                      color: whiteColor,
                      child: const Text(
                        "Explore Catalog",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      )),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: greyColor,
                          width: 1,
                        )),
                    child: Row(
                      children: const [
                        SizedBox(width: 5),
                        Icon(
                          Icons.search,
                          size: 28,
                          color: blueColor,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Search Catalog",
                          style: TextStyle(fontSize: 16, color: greyColor),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ExploreCategoryScreen(
                cartView: (price, quantity) {},
                getServiceUserData: GetServiceUserDataModel(),
              )),
            ]),
          )),
    );
  }
}
