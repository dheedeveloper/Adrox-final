import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Login/creatAccount/view/setupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadAuth extends StatefulWidget {
  const DownloadAuth({super.key});

  @override
  State<DownloadAuth> createState() => _DownloadAuthState();
}

class _DownloadAuthState extends State<DownloadAuth> {
  void verifyScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SetupScreen(),
        ));
  }

  final String playStoreUrl = "https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&pcampaignid=web_share";

  void _launchURL() async {
    final Uri url = Uri.parse("https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(
          title: 'Setup 2FA',
          showBackButton: false,
        ),
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   title: Text(
        //     "Setup 2FA",
        //     style: TextStyle(
        //         color: Colors.black,
        //         fontFamily: "Roboto-medium",
        //         fontSize: 18.sp,
        //         fontWeight: FontWeight.w500),
        //   ),
        // ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                width: double.infinity.w,
                height: 400.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Download  Authenticator Application",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto-medium",
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(AppImage.verify),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:() {
                                _launchURL();
                          },
                          child: Container(
                            height: 50.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.grey.shade300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(AppImage.playStore),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Available on\n", // Top text with smaller font size
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Roboto-medium",
                                          fontSize: 10.sp, // Smaller font size
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "Play Store", // Bottom text with larger font size
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Roboto-medium",
                                          fontSize: 16.sp, // Larger font size
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Colors.grey.shade300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(AppImage.appStore),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Available on\n", // Top text with smaller font size
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Roboto-medium",
                                        fontSize: 10.sp, // Smaller font size
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "App Store", // Bottom text with larger font size
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Roboto-medium",
                                        fontSize: 16.sp, // Larger font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                verifyScreen();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300.w, 40.h),
                backgroundColor: const Color(0xff3F5FF2),
              ),
              child: Text(
                "Next Step",
                style: TextStyle(
                  fontFamily: "Roboto-regular",
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
