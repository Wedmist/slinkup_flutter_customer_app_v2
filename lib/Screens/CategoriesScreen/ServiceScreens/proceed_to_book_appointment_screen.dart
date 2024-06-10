import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/ServiceScreens/proceed_to_book_by_name_appointment.dart';
import 'package:flutter_customer_app/Utils/constants.dart';

class ProceedToBookAppointmentScreen
    extends StatefulWidget {
  const ProceedToBookAppointmentScreen({Key? key})
      : super(key: key);

  @override
  State<ProceedToBookAppointmentScreen>
      createState() =>
          _ProceedToBookAppointmentScreenState();
}

class _ProceedToBookAppointmentScreenState
    extends State<
        ProceedToBookAppointmentScreen> {
  List<String> items = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
    'Category 6',
  ];
  String? _chosenValue;
  Map<String, bool> values = {
    'Basic Party Makeup for Family 1': false,
    'Basic Party Makeup for Family 2': false,
    'Basic Party Makeup for Family 3': false,
    'Basic Party Makeup for Family 4': false,
    'Basic Party Makeup for Family 5': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        mainAxisAlignment:
            MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: blackColor,
                      size: 25,
                    )),
                const Text(
                  "Explore Catalog",
                  style: TextStyle(fontSize: 18),
                ),
                const Spacer(),
                const Text(
                  "Skip",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Please Select Service Category",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: greyColor,
                  fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 10, right: 10),
            child: DropdownButton<String>(
              value: _chosenValue,
              iconSize: 28,
              itemHeight: 50,
              isExpanded: true,
              focusColor: lightblue,
              style: const TextStyle(
                  color: blackColor),
              items: items
                  .map<DropdownMenuItem<String>>(
                      (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please Select Service Category",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              onChanged: (String? value) {
                setState(() {
                  _chosenValue = value!;
                });
              },
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 8,
            color: lightBackGroundColor,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Explore Services",
              style: TextStyle(
                  color: blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "Please Add Services you wish to avail in the store"),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children:
                  values.keys.map((String key) {
                return Padding(
                  padding:
                      const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: greyColor,
                        width: 1,
                      ),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        key,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          const Text(
                            "₹3,000",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight
                                        .bold),
                          ),
                          const SizedBox(
                              width: 10),
                          const Text(
                            "₹3,000",
                            style: TextStyle(
                                decoration:
                                    TextDecoration
                                        .lineThrough,
                                fontSize: 16,
                                color: greyColor,
                                fontWeight:
                                    FontWeight
                                        .bold),
                          ),
                          const SizedBox(
                              width: 10),
                          Container(
                            decoration:
                                BoxDecoration(
                              color:
                                  lightGreenColor,
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          10),
                              border: Border.all(
                                color: greenColor,
                                width: 1,
                              ),
                            ),
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 4,
                                      bottom: 4),
                              child: Text(
                                "You Save 40%",
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        greenColor,
                                    fontWeight:
                                        FontWeight
                                            .w500),
                              ),
                            ),
                          )
                        ],
                      ),
                      value: values[key],
                      activeColor: Colors.pink,
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          values[key] = value!;
                        });
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: const Text(
                " Get Selected Checkbox Items ",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ProceedToBookByNameAppontment(),
                    ));
              },
              // onPressed: getCheckboxItems,
              // color: Colors.deepOrange,
              // textColor: Colors.white,
              // splashColor: Colors.grey,
              // padding:
              //     EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
          const SizedBox(height: 50),
        ],
      )),
    );
  }
}
