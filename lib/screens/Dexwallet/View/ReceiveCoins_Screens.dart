import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceivecoinsScreens extends StatefulWidget {
  const ReceivecoinsScreens({super.key});

  @override
  State<ReceivecoinsScreens> createState() => _ReceivecoinsScreensState();
}

class _ReceivecoinsScreensState extends State<ReceivecoinsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Receive Coin')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.sp,
                        right: 14.sp,
                        top: 15.sp,
                      ),
                      child: Container(
                        width: 0.89.sw,
                        height: 0.65.sh,

                        decoration: BoxDecoration(
                          color: Color(0xffF4F4F6),
                          borderRadius: BorderRadius.circular(30.sp),
                        ),
                        child: Column(
                          children: [
                            CustomBoxes.qrCodeBox(
                              coinImage1: AppImage.Usdt,
                              coinImage2: AppImage.Adx,
                              onTap: () {},
                              qrImage: AppImage.qrCode,
                              secretCode:
                                  '0xSDFHJKHSDFKSDKFJHSKDFJKJSDFJNSKDFJSDSDFNJ',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
