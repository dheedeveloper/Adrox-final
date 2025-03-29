import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Login/creatAccount/view/verifyscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  void verify() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifyScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), color: Colors.white),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back)),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Setup 2FA",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Roboto-medium",
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            Container(
              height: 400.h,
              width: 350.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Scan QR",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto-regular",
                        fontSize: 18.sp),
                  ),
                  Image.asset(
                    AppImage.qrCode,
                    height: 240,
                  ),
                  Text(
                    "Your Secret Code",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto-regular",
                        fontSize: 18.sp),
                  ),
                  Text(
                    "0xDF563e3D98F2A0F3d6a5cbd048b0D40f88079756",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto-regular",
                      fontSize: 18.sp,
                    ),
                  ),
                  Image.asset(
                    AppImage.copyImg,
                    height: 24,
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomBoxes.button(
                onTap: () {
                  verify();
                },
                text: 'Next Step'),
          ],
        ),
      ),
    ));
  }
}
