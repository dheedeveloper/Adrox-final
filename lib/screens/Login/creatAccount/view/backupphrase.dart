import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'confirmbackup.dart';

class BackupPhrase extends StatefulWidget {
  const BackupPhrase({super.key});

  @override
  State<BackupPhrase> createState() => _BackupPhraseState();
}

class _BackupPhraseState extends State<BackupPhrase> {
  void confirmBackup() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ConfirmBackup()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
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
              top: MediaQuery.of(context).size.height * 0.1,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  AppImage.logo,
                  color: Colors.white,
                  height: 85,
                  width: 290,
                ),
              ),
            ),

            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  elevation: 0.1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Backup Phrase",
                          style: TextStyle(
                              fontFamily: "Roboto-medium",
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          StringValues.backupCont,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontFamily: "Roboto-regular",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Phrase",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto-regular",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 200.h,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5.h,
                              crossAxisSpacing: 5.w,
                              childAspectRatio: 120.w / 30.h,
                            ),
                            itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(color: Colors.black45),
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}. letter",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto-regular",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBoxes.button(
                              textColor: AppColors.primarycolor,
                              buttonColor: Colors.white,
                              size: 93,
                              onTap: () {},
                              text: "Copy",
                            ),
                            CustomBoxes.button(
                                size: 182,
                                onTap: () {
                                  confirmBackup();
                                },
                                text: "Next Step"),
                          ],
                        ),
                      ],
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
      resizeToAvoidBottomInset: false,
      body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          padding: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImage.loginBg), fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.bottomCenter, // Adjust as needed
            child: Container(
              margin: EdgeInsets.only(
                  top: 150.h), // Equivalent to top: 200.h in Positioned
              padding: EdgeInsets.all(20.h),
              height: 450.h,
              width: 320.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Backup Phrase",
                    style: TextStyle(
                      fontFamily: "Roboto-medium",
                      fontSize: 25.sp,
                    ),
                  ),
                  Text(
                    StringValues.backupCont,
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Roboto-regular",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Phrase",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto-regular",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 200.h, // Fixed height
                    child: GridView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), // Prevent scrolling
                      itemCount: 10, // 6 rows x 2 columns
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns
                        mainAxisSpacing: 5.h, // Adjust spacing between rows
                        crossAxisSpacing: 5.w, // Adjust spacing between columns
                        childAspectRatio:
                            120.w / 30.h, // Adjust aspect ratio for better fit
                      ),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black45),
                        ),
                        child: Center(
                          child: Text(
                            "${index + 1}. letter",
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Roboto-regular",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100.w, 40.h),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff3F5FF2)),
                              borderRadius: BorderRadius.circular(20.r)),
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Copy",
                          style: TextStyle(
                            fontFamily: "Roboto-regular",
                            fontSize: 16.sp,
                            color: Color(0xff3F5FF2),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          confirmBackup();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(150.w, 40.h),
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
                    ],
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
