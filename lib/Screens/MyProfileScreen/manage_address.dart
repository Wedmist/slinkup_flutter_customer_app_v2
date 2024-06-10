import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Apis/api_constants.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Model/address/get_all_address_model.dart';
import 'package:flutter_customer_app/Screens/Location/add_new_address.dart';
import 'package:flutter_customer_app/Screens/Location/current_location.dart';
import 'package:flutter_customer_app/Utils/shimmer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/constants.dart';

class ManageAddress extends StatefulWidget {
  final Function(AddressModel ads)? updateAdress;
  const ManageAddress({Key? key, this.updateAdress}) : super(key: key);

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  List<AddressModel> addressList = [];
  bool isLoading = false;
  AddressModel? selectedAddress;
  @override
  initState() {
    loadAddressData();
    super.initState();
  }

  loadAddressData() async {
    isLoading = true;
    setState(() {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId');
    addressList = await ApiHelpers().getAllAddressView(api: getAllAddressApi + userId.toString());
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: greyLightColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: whiteColor,
            )),
        title: const Text(
          "Select Address",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AddNewAddress(
                      address: null,
                      loadAddressList: () {
                        loadAddressData();
                      });
                },
              ));
            },
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.add, color: GetlightblueColor),
                  SizedBox(width: 15),
                  Text(
                    "Add Another Address",
                    style: TextStyle(color: GetlightblueColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 5, color: greyColor),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CurrentLocation();
                },
              ));
            },
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.my_location_sharp, color: GetlightblueColor),
                  SizedBox(width: 15),
                  Text(
                    "Use my Current Location",
                    style: TextStyle(color: GetlightblueColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 5, color: greyColor),
          Expanded(
            child: isLoading
                ? const ShimmerView()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: addressList.length,
                    itemBuilder: (context, index) {
                      AddressModel address = addressList[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Radio<AddressModel>(
                                    value: address,
                                    groupValue: selectedAddress,
                                    onChanged: (value) {
                                      selectedAddress = value!;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          address.name ?? '',
                                          style: const TextStyle(
                                              color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                            "${address.houseNumber},${address.landmark},${address.city},${address.state},${address.pincode}"),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          '${address.phoneNumber}',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(
                                              builder: (context) {
                                                return AddNewAddress(
                                                    address: address,
                                                    loadAddressList: () {
                                                      loadAddressData();
                                                    });
                                              },
                                            ));
                                          },
                                          child: Card(
                                            child: Container(
                                              width: 65,
                                              height: 25,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "Edit",
                                                style: TextStyle(color: blueColor, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return addressDialog(context, address);
                                              },
                                            );
                                          },
                                          child: Card(
                                            child: Container(
                                              width: 65,
                                              height: 25,
                                              alignment: Alignment.center,
                                              child: const Text(
                                                "Remove",
                                                style: TextStyle(color: orangeColor, fontWeight: FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          MaterialButton(
            height: 45,
            minWidth: 300,
            color: buttonColor,
            onPressed: () {
              widget.updateAdress!(selectedAddress!);
              Navigator.pop(context);
            },
            child: const Text(
              "Save Address",
              style: TextStyle(color: whiteColor),
            ),
          ),
        ],
      ),
    ));
  }

  Widget addressDialog(BuildContext context, AddressModel model) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(5),
      // insetPadding: EdgeInsets.all(0),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            const Text(
              "Are you Sure,You want to remove this address?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var data = await ApiHelpers()
                          .deleteAddress(deleteUrl: "$deleteAddressApi${model.addressId}/user_id/${model.customerId}");

                      if (data['status'] == 200) {
                        loadAddressData();
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);

                        Fluttertoast.showToast(
                            msg: "Address Deleted successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6), border: Border.all(width: 1, color: greyColor)),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: blueColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // set up the AlertDialog
}
