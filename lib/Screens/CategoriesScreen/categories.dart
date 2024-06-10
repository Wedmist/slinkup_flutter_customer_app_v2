import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/service_screen.dart';
import 'package:flutter_customer_app/Screens/HomeScreen/Components/carousel_slider_image.dart';

import '../../Apis/api_constants.dart';
import '../../Apis/api_helper.dart';
import '../../Model/get_all_categories_model.dart';
import '../../Utils/constants.dart';
import '../../Utils/shimmer.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<GetAllCatModel>? getAllCategoires;
  bool isLoading = false;
  @override
  void initState() {
    getAllcat();
    // TODO: implement initState
    super.initState();
  }

  getAllcat() async {
    setState(() {
      isLoading = true;
    });
    getAllCategoires = await ApiHelpers().fetchAllCategoriesData(api: getAllCategories);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back,
          //       color: blackColor,
          //     )),
          title: const Text(
            "All Categories",
            style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const Padding(
            //   padding: EdgeInsets.only(left: 18, top: 18),
            //   child: TitleString(title: "All Categories", fontSize: 20),
            // ),
            const Padding(
                padding: EdgeInsets.only(left: 18, right: 8, bottom: 8),
                child: Text(
                  "Choose our services through our categories",
                  style: TextStyle(color: blackColor, fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Roboto"),
                )),
            isLoading
                ? const Expanded(child: ShimmerView())
                : getAllCategoires == null
                    ? const SizedBox()
                    : Expanded(
                        child: Container(
                            color: backgroundColor,
                            child: ListView.builder(
                              itemCount: getAllCategoires?.length,
                              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                              itemBuilder: (context, index) {
                                GetAllCatModel? getAllCat = getAllCategoires?[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ServiceScreen(workcatId: getAllCat!.workCategoryId!),
                                        ));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    child: SizedBox(
                                      height: height / 5,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Container(
                                                  height: 120,
                                                  width: 50,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                                  padding: const EdgeInsets.all(10),
                                                  child: getAllCat?.image == null
                                                      ? Image.asset('assets/Images/Image_gallery.png')
                                                      : Image.network(
                                                          getAllCat?.image ?? "",
                                                          fit: BoxFit.fill,
                                                        ),
                                                ),
                                              )),
                                          Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 30, bottom: 8, right: 10, left: 5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TitleString(title: getAllCat?.category ?? "", fontSize: 18),
                                                    const SizedBox(height: 10),
                                                    // const Expanded(
                                                    //     child: Text(
                                                    //         "saidhaishdiasjkfsakfkasohfhasoihfihsaihfioasjifhsahiohflhasiliasifhi"))
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                      ),
          ],
        ),
      ),
    );
  }
}
