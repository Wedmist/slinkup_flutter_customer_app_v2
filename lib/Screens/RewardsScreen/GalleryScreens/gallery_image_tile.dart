import 'package:flutter/material.dart';

import '../../../Utils/Images.dart';
import '../../../Utils/constants.dart';

class GalleryImageTile extends StatelessWidget {
  const GalleryImageTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    Images.networkImage)),
            borderRadius:
                BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Row(
              children: const [
                Spacer(),
                Icon(Icons.image,
                    color: whiteColor),
                Text(
                  "50",
                  style: TextStyle(
                      color: whiteColor),
                ),
                SizedBox(width: 10)
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Radhika’s Wedding",
                    style: TextStyle(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight:
                            FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Bhubaneswar",
                    style: TextStyle(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight:
                            FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
