import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/CategoriesScreen/Components/home_icon.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:flutter_customer_app/Utils/constants.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank you"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Image.asset(Images.thankyouImg),
            SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thank you",
                    style: TextStyle(
                      fontFamily: "Oregano",
                      fontSize: 40,
                      color: greenColor,
                    ),
                  ),
                  Image.asset(
                    IconsView.checkIcon,
                    scale: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Hi Biggy, Thank you for availing service from Slinkup.com",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            Text(
              "We have also sent you an email with the details of your order or you can check your order details in the “My Booking” Page.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 25),
            HomeIconView(wt: 150),
          ],
        ),
      ),
    );
  }
}
