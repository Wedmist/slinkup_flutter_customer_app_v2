import 'package:flutter/material.dart';

class CancellationPolicyTile
    extends StatelessWidget {
  final Color backGroundColor;
  const CancellationPolicyTile({
    required this.backGroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Cancellation Policy:",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child:
                    Icon(Icons.circle, size: 10),
              ),
              SizedBox(width: 5),
              SizedBox(
                height: 40,
                width: 310,
                child: Text(
                  "You can reschedule or cancel your booking before 2 hours of the alloted time",
                  maxLines: 2,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 2),
                child:
                    Icon(Icons.circle, size: 10),
              ),
              SizedBox(width: 5),
              SizedBox(
                height: 30,
                width: 310,
                child: Text(
                  "Reschedule after that will penalized you ₹50",
                  maxLines: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
