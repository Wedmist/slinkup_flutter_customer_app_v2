import 'package:flutter/material.dart';

import '../../Utils/Images.dart';
import '../../Utils/constants.dart';
import '../HomeScreen/Components/carousel_slider_image.dart';

class CustomerReviewsScreen
    extends StatelessWidget {
  final ScrollPhysics? physics;
  const CustomerReviewsScreen(
      {this.physics, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
          left: 10, right: 10, bottom: 10),
      itemCount: 5,
      physics: physics,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: greyColor,
                      image: DecorationImage(
                          image: AssetImage(
                              Images.house),
                          fit: BoxFit.fill),
                      shape: BoxShape.circle),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const TitleString(
                        title: "Customer No. C",
                        fontSize: 16),
                    const SizedBox(height: 5),
                    const Text(
                      "15 SEP 2022",
                      style: TextStyle(
                          fontSize: 12,
                          color: greyColor),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star,
                            color: yellowColor),
                        Icon(Icons.star,
                            color: yellowColor),
                        Icon(Icons.star,
                            color: yellowColor),
                        Icon(Icons.star,
                            color: yellowColor),
                        Icon(Icons.star,
                            color: yellowColor),
                        SizedBox(width: 5),
                        TitleString(
                            title: "(4.7)",
                            fontSize: 14)
                      ],
                    )
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert)
              ],
            ),
            const SizedBox(height: 5),
            const SizedBox(
              height: 65,
              child: Text(
                  "A review is an evaluation of a publication, product, service, or company or a critical take on current affairs in literature, politics or culture. "),
            ),
            const Divider(
              height: 1,
              color: greyColor,
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
