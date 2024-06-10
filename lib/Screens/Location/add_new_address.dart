import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_customer_app/Apis/api_constants.dart';
import 'package:flutter_customer_app/Apis/api_helper.dart';
import 'package:flutter_customer_app/Model/address/get_all_address_model.dart';
import 'package:flutter_customer_app/Model/address/stateModel.dart';
import 'package:flutter_customer_app/Utils/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewAddress extends StatefulWidget {
  final Function()? loadAddressList;
  final AddressModel? address;
  const AddNewAddress({super.key, this.loadAddressList, this.address});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  String? dropdownValue;
  Map<String, List<String>>? statesList;
  String? selectedState;
  String? selectedCity;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController alternateNumberCtrl = TextEditingController();
  TextEditingController pinCodeCtrl = TextEditingController();
  TextEditingController houseNumberCtrl = TextEditingController();
  TextEditingController landMarkCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  initState() {
    loadStatesData();
    if (widget.address != null) {
      nameCtrl = TextEditingController(text: widget.address?.name);
      phoneNumberCtrl = TextEditingController(text: widget.address?.phoneNumber.toString());
      alternateNumberCtrl = TextEditingController(text: widget.address?.alternatePhoneNumber.toString());
      pinCodeCtrl = TextEditingController(text: widget.address?.pincode.toString());
      houseNumberCtrl = TextEditingController(text: widget.address?.houseNumber);
      landMarkCtrl = TextEditingController(text: widget.address?.landmark);
      selectedState = widget.address?.state;
      selectedCity = widget.address?.city;
    }
    super.initState();
  }

  onStateChanged(String? newState) {
    setState(() {
      selectedCity = null;
      selectedState = newState!;
    });
  }

  void onCityChanged(String? newCity) {
    setState(() {
      selectedCity = newCity!;
    });
  }

  Future<String> loadStatesData() async {
    var data = await rootBundle.loadString("assets/states/states_list.json");
    statesList = getPhotosModelFromJson(data);

    setState(() {});
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Name Required';
                  else
                    return null;
                },
                controller: nameCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: phoneNumberCtrl,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.length != 10) {
                    return 'Phone Number must be of 10 digit';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'Enter Phone Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: alternateNumberCtrl,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.length != 10) {
                    return 'Phone Number must be of 10 digit';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Alternate Phone Number',
                  hintText: 'Enter Alternate Phone Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: pinCodeCtrl,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.length != 6) {
                    return 'Mobile Number must be of 10 digit';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pincode',
                  hintText: 'Enter Pincode',
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black54)),
                  child: DropdownButton<String>(
                    value: selectedState,
                    elevation: 0,
                    itemHeight: 50,
                    underline: const SizedBox(),
                    isExpanded: false,
                    padding: const EdgeInsets.all(4),
                    hint: const Text("Select State"),
                    onChanged: onStateChanged,
                    items: statesList?.keys.map<DropdownMenuItem<String>>((String? state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state!),
                      );
                    }).toList(),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 130,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black54)),
                  child: DropdownButton<String>(
                    value: selectedCity,
                    underline: const SizedBox(),
                    elevation: 0,
                    itemHeight: 50,
                    padding: const EdgeInsets.all(4),
                    onChanged: onCityChanged,
                    hint: const Text("Select City"),
                    isExpanded: false,
                    items: statesList?[selectedState]?.map<DropdownMenuItem<String>>((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(city),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: houseNumberCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'House No Required';
                  else
                    return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'House No,Building No',
                  hintText: 'Enter House No,Building No',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: landMarkCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Location Required';
                  else
                    return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Location,Area,Road,Colony',
                  hintText: 'Enter Location,Area,Road,Colony',
                ),
              ),
            ),
            const SizedBox(height: 50),
            MaterialButton(
              height: 45,
              minWidth: 300,
              color: buttonColor,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  var userId = prefs.getInt('userId');
                  var data;
                  if (widget.address == null) {
                    Map<String, dynamic> parms = {
                      "customer_id": userId,
                      "name": nameCtrl.text,
                      "phone_number": phoneNumberCtrl.text,
                      "alternate_phone_number": alternateNumberCtrl.text,
                      "pincode": pinCodeCtrl.text,
                      "state": selectedState,
                      "city": selectedCity,
                      "house_number": houseNumberCtrl.text,
                      "landmark": landMarkCtrl.text
                    };

                    data = await ApiHelpers().addNewAddress(params: parms, postUrl: addANewAddressApi);
                    //   } else {
                    // var    data = await ApiHelpers().addNewAddress(params: parms, postUrl: editAddressApi);
                  } else {
                    Map<String, dynamic> parms = {
                      "address_id": widget.address?.addressId,
                      "name": nameCtrl.text,
                      "phone_number": phoneNumberCtrl.text,
                      "alternate_phone_number": alternateNumberCtrl.text,
                      "pincode": pinCodeCtrl.text,
                      "state": selectedState,
                      "city": selectedCity,
                      "house_number": houseNumberCtrl.text,
                      "landmark": landMarkCtrl.text
                    };
                    data = await ApiHelpers().updateExistingAddress(params: parms, putUrl: editAddressApi);
                  }
                  if (data['status'] == 200) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    widget.loadAddressList!();
                    Fluttertoast.showToast(
                        msg: "Address Added successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }
              },
              child: const Text(
                "Save Address",
                style: TextStyle(color: whiteColor),
              ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
