import 'dart:async';
import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/utility/Navigation_Helper.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/localstorage.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:adrox/screens/Landing/homemenu/view/homescreen.dart';
import 'package:adrox/screens/Landing/lendingMenu/view/lendingscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'landingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // splash() {
  //   Timer(
  //       const Duration(seconds: 3),
  //       () => Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const LandingScreen(),
  //           )));
  // }
  double progress = 0.0;
  void _startLoading() {
    Timer.periodic(Duration(milliseconds: 500), (timer) async {
      setState(() {
        if (progress < 1.0) {
          progress += 0.1;
        } else {
          timer.cancel();
          _navigateBasedOnAuthToken(); // Call async function to check auth token
        }
      });
    });
  }

  Future<void> _navigateBasedOnAuthToken() async {
    String? authToken = await SharedPrefHelper.getString("AuthToken");

    if (authToken != null && authToken.trim().isNotEmpty) {
      setState(() {
        DynamicStrings().token = authToken;
      });

      print(">>>>>>>>>>>>>>>>> AuthToken: $authToken");

      NavigationHelper.navigateAndRemoveUntil(
        context: context,
        page: HomeScreen(),
      );
    } else {
      print("No AuthToken found, navigating to LandingScreen");

      NavigationHelper.navigateAndRemoveUntil(
        context: context,
        page: LandingScreen(),
      );
    }
  }

  @override
  void initState() {
    _startLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              // 🔹 Expands to center logo properly
              child: Center(
                child: Image.asset(
                  width: 320,
                  AppImage.logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff3F5FF2), width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(15),
                          value: progress,
                          minHeight: 10,
                          backgroundColor: Colors.white,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primarycolor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
