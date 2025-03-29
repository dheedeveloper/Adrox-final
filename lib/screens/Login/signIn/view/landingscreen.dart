import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Login/signIn/view/signinscreen.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../creatAccount/view/createaccount.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void signIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignInScreen()));
  }

  void createWallet() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateAccount(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 260,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImage.bluebg,
                fit: BoxFit.cover,
              ),
            ),

            // Centered Logo
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  AppImage.logo,
                  color: Colors.white,
                  height: 93,
                  width: 292,
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  elevation: 0.1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    width: 320.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringValues.landingTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Roboto-medium",
                              fontSize: 31.sp,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            StringValues.landingCont,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontFamily: "Roboto-regular",
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomBoxes.button(
                                  buttonColor: Colors.black,
                                  size: 172,
                                  onTap: () {
                                    createWallet();
                                  },
                                  text: 'Create Wallet'),
                              CustomBoxes.button(
                                  size: 103,
                                  onTap: () {
                                    signIn();
                                  },
                                  text: 'Sign In'),
                              // ElevatedButton(
                              //   onPressed: () {
                              //     createWallet();
                              //   },
                              //   style: ElevatedButton.styleFrom(
                              //     fixedSize: Size(150.w, 40.h),
                              //     backgroundColor: const Color(0xff12172C),
                              //   ),
                              //   child: Text(
                              //     "Create Wallet",
                              //     style: TextStyle(
                              //       fontFamily: "Roboto-regular",
                              //       fontSize: 16.sp,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // ),
                              // ElevatedButton(
                              //   onPressed: () {
                              //     signIn();
                              //   },
                              //   style: ElevatedButton.styleFrom(
                              //     fixedSize: Size(100.w, 40.h),
                              //     backgroundColor: const Color(0xff3F5FF2),
                              //   ),
                              //   child: Text(
                              //     "Sign In",
                              //     style: TextStyle(
                              //       fontFamily: "Roboto-regular",
                              //       fontSize: 16.sp,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return SafeArea(
        child: Scaffold(
      body: Container(
          padding: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AppImage.logo),
            fit: BoxFit.contain,
          )),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 200.h),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
              height: 320.h,
              width: 320.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringValues.landingTitle,
                    style: TextStyle(
                      fontFamily: "Roboto-medium",
                      fontSize: 31.sp,
                    ),
                  ),
                  Text(
                    StringValues.landingCont,
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Roboto-regular",
                      fontSize: 12.sp,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          createWallet();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150.w, 40.h),
                          backgroundColor: const Color(0xff12172C),
                        ),
                        child: Text(
                          "Create Wallet",
                          style: TextStyle(
                            fontFamily: "Roboto-regular",
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signIn();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100.w, 40.h),
                          backgroundColor: const Color(0xff3F5FF2),
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontFamily: "Roboto-regular",
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            AppImage.bluebg,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Container(
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Discover ADROX in your way',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sign in to access your Wallet and manage your preferences. '
                    'Create an account for a seamless experience.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          'Create Wallet',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.blue),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
