import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Utils/constants.dart';
import 'package:flutter_customer_app/dash_board_screen.dart';

class HomeIconView extends StatelessWidget {
  final double wt;
  const HomeIconView({super.key, required this.wt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DashboardScreen();
          },
        ));
      },
      child: Container(
        height: 50,
        width: wt,
        decoration: BoxDecoration(
          color: GetlightblueColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              color: whiteColor,
            ),
            SizedBox(width: 8),
            Text(
              "Home",
              style: TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
