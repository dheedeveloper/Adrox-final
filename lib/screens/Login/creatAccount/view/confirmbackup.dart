import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'downloadauth.dart';

class ConfirmBackup extends StatefulWidget {
  const ConfirmBackup({super.key});

  @override
  State<ConfirmBackup> createState() => _ConfirmBackupState();
}

class _ConfirmBackupState extends State<ConfirmBackup> {
  final enterPhrase = TextEditingController();
  void authenticator() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DownloadAuth()));
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
                          "Confirm Backup",
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
                          ),
                        ),
                        TextField(
                          maxLines: 10,
                          controller: enterPhrase,
                          decoration: InputDecoration(
                            hintText: "Enter Phrase",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontFamily: "Roboto-regular",
                            ),

                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 220.0, right: 10),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text("Paste",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontFamily: "Roboto-regular",
                                      ))),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 20.w), // Adjust content padding
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBoxes.button(
                              textColor: Colors.black,
                              buttonColor: AppColors.scaffoldColor,
                              size: 93,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              text: "Back",
                            ),
                            CustomBoxes.button(
                                size: 182,
                                onTap: () {
                                  authenticator();
                                },
                                text: "Done"),
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
  }
}
