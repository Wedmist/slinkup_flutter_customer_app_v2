import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/birdal_makeup.dart';

import '../../../Apis/api_constants.dart';
import '../../../Model/get_services_by_category_model.dart';
import '../../../Utils/constants.dart';
import '../../../Utils/shimmer.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key, required this.workcatId}) : super(key: key);
  final int workcatId;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<GetServiceByCatIdModel>? serviceBYCatID;
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
    serviceBYCatID = await ApiHelpers().fetchServicesByCatID(api: getServicesByCategory + widget.workcatId.toString());
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
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: const Text("Category Name"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: whiteColor,
              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
              child: const Text(
                "Please Select an Service",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, fontFamily: "Roboto"),
              ),
            ),
            isLoading
                ? const Expanded(child: ShimmerView())
                : serviceBYCatID == null
                    ? const SizedBox()
                    : Expanded(
                        child: Container(
                            color: backgroundColor,
                            child: ListView.builder(
                              itemCount: serviceBYCatID?.length,
                              itemBuilder: (context, index) {
                                GetServiceByCatIdModel? serviceCatId = serviceBYCatID?[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BirdalMakeUp(
                                              catId: serviceCatId?.categoryId, servicesId: serviceCatId?.serviceId),
                                        ));
                                  },
                                  child: Card(
                                    elevation: 0,
                                    margin: const EdgeInsets.only(bottom: 1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                                    child: SizedBox(
                                      height: height / 5,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: serviceCatId?.image == null
                                                    ? SizedBox(
                                                        height: 120,
                                                        width: 50,
                                                        child: Image.asset('assets/Images/Image_gallery.png'))
                                                    : Container(
                                                        height: 120,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                                        padding: const EdgeInsets.all(10),
                                                        child: Image.network(
                                                          serviceCatId?.image ?? "",
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                              )),
                                          Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 8, right: 10, left: 5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(serviceCatId?.serviceName ?? ""),
                                                  ],
                                                ),
                                              )),
                                          Expanded(
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.arrow_forward_ios_rounded,
                                                    color: blueColor,
                                                  )))
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
