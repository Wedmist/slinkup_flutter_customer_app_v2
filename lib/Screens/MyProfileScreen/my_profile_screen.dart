import 'package:flutter/material.dart';
import 'package:flutter_customer_app/Screens/MyProfileScreen/manage_address.dart';
import 'package:flutter_customer_app/Screens/SplashScreen/splash_screen.dart';
import 'package:flutter_customer_app/Utils/Images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/address/get_all_address_model.dart';
import '../../Utils/constants.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                )),
            title: const Text(
              "My Profile",
              style: TextStyle(color: whiteColor),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Hello, Akash Dandpat",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    // const Spacer(),
                    // IconButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => const EditProfile(),
                    //           ));
                    //     },
                    //     icon: const Icon(Icons.edit))
                  ],
                ),
                //const Text("9876543210"),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () => showDialogview(context),
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  leading: Icon(Icons.person),
                  title: Text(
                    " Manage My Profile",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  onTap: () => showDialogview(context),
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  leading: Icon(Icons.book),
                  title: Text(
                    "My Bookings",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  onTap: () {
                    showDialogview(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const CustomerSupport(),
                    //     ));
                  },
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  leading: const Icon(Icons.person_outline),
                  title: const Text(
                    "Customer Support",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  onTap: () {
                    // showDialogview(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageAddress(
                            updateAdress: (AddressModel ads) {},
                          ),
                        ));
                  },
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  leading: const Icon(Icons.person_outline),
                  title: const Text(
                    "Manage Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  onTap: () => showDialogview(context),
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  leading: Icon(Icons.screen_share_sharp),
                  title: Text(
                    "Share the App",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  onTap: () => showDialogview(context),
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  leading: Icon(Icons.info),
                  title: Text(
                    "About Us",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                // const ListTile(
                //   contentPadding: EdgeInsets.all(0),
                //   minLeadingWidth: 0,
                //   leading: Icon(Icons.person),
                //   title: Text(
                //     "My Profile",
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                //   ),
                // ),
                ListTile(
                  onTap: () => showDialogview(context),
                  contentPadding: EdgeInsets.all(0),
                  minLeadingWidth: 0,
                  leading: Icon(Icons.rotate_right),
                  title: Text(
                    "Rate us on Playstore",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    await preferences.clear();
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Splash();
                      },
                    ));
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    minLeadingWidth: 0,
                    leading: Icon(Icons.logout),
                    title: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Follow Us On:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      IconsView.instaIcon,
                      scale: 3,
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      IconsView.facebookIcon,
                      scale: 3,
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      IconsView.linkedInIcon,
                      scale: 3,
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      IconsView.twitterIcon,
                      scale: 3,
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      IconsView.youtubeIcon,
                      scale: 3,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  void showDialogview(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'Still Wait for Next Version',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
