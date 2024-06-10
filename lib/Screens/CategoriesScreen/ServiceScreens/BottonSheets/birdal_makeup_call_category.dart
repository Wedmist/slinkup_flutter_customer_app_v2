import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Model/get_sub_services_provider_detailsa_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utils/Images.dart';
import '../../../../Utils/constants.dart';
import '../../Components/components_screen.dart';

class BirdalMakeupCallCategory extends StatelessWidget {
  final GetServiceUserDataModel? getServiceUserData;
  const BirdalMakeupCallCategory({Key? key, this.getServiceUserData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 12, bottom: 12, right: 8),
        child: Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () async {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: getServiceUserData?.mobileNo.toString() ?? "",
                );
                await launchUrl(launchUri);
              },
              child: CategoryComponent(
                imageView: Images.callImage,
                imageText: "Call Now",
              ),
            ),
            // Spacer(),
            // GestureDetector(
            //   onTap: () async {
            //     final Uri launchUri = Uri(
            //       scheme: 'sms',
            //       path: getServiceUserData?.mobileNo.toString() ?? "",
            //     );
            //     await launchUrl(launchUri);
            //   },
            //   child: CategoryComponent(
            //     imageView: Images.imageGallery,
            //     imageText: "Message",
            //   ),
            // ),
            // Spacer(),
            // CategoryComponent(
            //   imageView: Images.imageGallery,
            //   imageText: "Gallery",
            // ),
            Spacer(),
            CategoryComponent(
              imageView: Images.imageGallery,
              imageText: "Gallery",
            ),
            Spacer(),
            CategoryComponent(
              imageView: IconsView.reviewIcon,
              imageText: "Review",
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
