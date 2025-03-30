import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:adrox/screens/Landing/lendingMenu/view/lendingscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisableScreen extends StatefulWidget {
  const DisableScreen({super.key});

  @override
  State<DisableScreen> createState() => _DisableScreenState();
}

class _DisableScreenState extends State<DisableScreen> {
  final verifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 660.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.keyboard_backspace_rounded)),
                      ),
                      SizedBox(
                        width: 70.w,
                      ),
                      Text(
                        "Disable 2FA",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto-medium",
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 60.h),
                  child: Image.asset(AppImage.verify),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                    width: double.infinity.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Disable 2FA Verifcation",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-medium",
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          StringValues.verify2fa,
                          style: TextStyle(
                            color: Colors.black45,
                            fontFamily: "Roboto-regular",
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          cursorColor: Colors.transparent,
                          controller: verifyController,
                          decoration: InputDecoration(
                              suffixIcon: Image.asset(
                                AppImage.copyImg,
                                height: 20.h,
                              ),
                              hintText: "Enter 2fa code",
                              hintStyle: TextStyle(
                                color: Colors.black38,
                                fontFamily: "Roboto-regular",
                                fontSize: 14.sp,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 20.w),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20.r)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20.r)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20.r))),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                CustomBoxes.button(
                  buttonColor: Color(0xffE46364),
                    onTap: (){  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LendingScreen(),
                    ));}, text:   "Deactivate 2fa"),
           
           
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
