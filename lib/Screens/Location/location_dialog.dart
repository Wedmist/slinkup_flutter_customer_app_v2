import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/MyProfileScreen/manage_address.dart';
import 'package:flutter_customer_app/Utils/constants.dart';

import '../../Model/address/get_all_address_model.dart';

class LocationDialogView extends StatefulWidget {
  const LocationDialogView({super.key});

  @override
  State<LocationDialogView> createState() => _LocationDialogViewState();
}

class _LocationDialogViewState extends State<LocationDialogView> {
  int selectedIndex = -1;
  int items = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 5),
            const Text(
              'Change Your Location',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(
                  Icons.my_location,
                  color: blueColor,
                ),
                SizedBox(width: 10),
                Text(
                  "Use my Current Location",
                  style: TextStyle(color: blueColor, fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: items + 1,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return (index != items)
                      ? GestureDetector(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: Card(
                            margin: const EdgeInsets.only(right: 8),
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  color: selectedIndex == index ? lightblueColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(width: 1, color: selectedIndex == index ? blueColor : greyLightColor)),
                              padding: const EdgeInsets.all(8),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    "Akash Dandpat",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("dsadh safbsafsabfy safjds fhbfasgfjajsf asfhasugfuasf",
                                      maxLines: 5,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ManageAddress(
                                  updateAdress: (AddressModel ads) {},
                                );
                              },
                            ));
                          },
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              padding: const EdgeInsets.all(6),
                              child: const SizedBox(
                                width: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: blueColor,
                                      size: 55,
                                    ),
                                    Text(
                                      "Add Another Address",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                },
              ),
            )
            // ElevatedButton(
            //   child: const Text('Close BottomSheet'),
            //   onPressed: () => Navigator.pop(context),
            // ),
          ],
        ),
      ),
    );
  }
}
