import 'package:flutter/material.dart';

import '../../../Utils/constants.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: lightBackGroundColor,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  )),
              title: const Text(
                "Payment Summary",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  width: width,
                  color: Colors.white,
                  height: 150,
                  child: Column(
                    children: [
                      Text(
                        'Amount Payable',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text('₹1069', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text('please pay this amount to Mr. Superstar Puneet',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: width,
                          child: Column(
                            children: [
                              Text(
                                'Billing Price',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Basic Party Makeup for Family'),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Advance Party Makeup for Family'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Coupon - FLAT100',
                                style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Total Amount:',
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: GetlightblueColor),
                      onPressed: () {},
                      child: Text('I will Pay by Cash'),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: GetlightblueColor),
                      onPressed: () {},
                      child: Text('I will Pay Online using UPI'),
                    )),
              )
            ])));
  }
}
