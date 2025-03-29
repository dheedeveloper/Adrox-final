import 'package:adrox/core/utility/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBoxes {
  static final CustomBoxes _singleton = CustomBoxes._internal();

  CustomBoxes._internal();

  static CustomBoxes get instance => _singleton;

  static showRoundBox({
    required String image,
    required String coin,
    required String balance,
    GestureTapCallback? onTap,
    required String hintText,
    required bool isFocused,
    required ValueChanged<bool> onFocusChange,
    String? dropDown,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isFocused ? Colors.black : Color(0xffCCCCCC),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          image,
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Text(coin),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Bal: ',
                          style: TextStyle(color: Color(0xff959595)),
                        ),
                        Text(balance),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            if (dropDown != null)
              GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  dropDown ?? '',
                  fit: BoxFit.cover,
                  width: 20,
                  height: 20,
                ),
              ),
            SizedBox(width: 8),
            Text(
              '|',
              style: TextStyle(
                fontSize: 35,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Focus(
                onFocusChange: onFocusChange,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(color: Color(0xffCCCCCC)),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showRoundBox2({required String hintText, required String idName}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffCCCCCC)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Row(
          children: [
            Text(idName),
            SizedBox(width: 8),
            Text(
              '|',
              style: TextStyle(
                fontSize: 35,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0xffCCCCCC)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showSwapBox({
    required String hintText,
    required String coin,
    String? dropDown,
    GestureTapCallback? onTap,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffCCCCCC)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Image.asset(image, width: 20, height: 20, fit: BoxFit.cover),
                  SizedBox(width: 5),
                  Text(coin),
                  SizedBox(width: 5),
                  if (dropDown != null)
                    Image.asset(
                      dropDown ?? '',
                      fit: BoxFit.cover,
                      width: 20,
                      height: 19,
                    ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Text(
              '|',
              style: TextStyle(
                fontSize: 35,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0xffCCCCCC)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static button({
    required GestureTapCallback? onTap,
    required String text,
    double? size = 350,
    Color? buttonColor = const Color(0xff3F5FF2),
    Color? textColor = Colors.white,
    bool? isLoading,
    bool hasBorder = false,
  }) {
    return SizedBox(
      width: size,
      height: 50.sp,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: hasBorder
              ? RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff3F5FF2)),
                  borderRadius: BorderRadius.circular(40.r),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
          elevation: 0,
          fixedSize: Size(150.w, 40.h),
          backgroundColor: buttonColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Roboto-normal",
            fontSize: 16.sp,
            color: textColor,
          ),
        ),
      ),
    );
  }

  static showSwapBox2({
    GestureTapCallback? onTap,
    required String hintText,
    required String coinName,
    String? dropDown,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffCCCCCC)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('To'),
                  Row(
                    children: [
                      Text(
                        coinName,
                        style: TextStyle(color: Color(0xff959595)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            '|',
            style: TextStyle(
              fontSize: 35,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Color(0xffCCCCCC)),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static qrCodeBox({
    required GestureTapCallback? onTap,
    required qrImage,
    required secretCode,
    required coinImage1,
    required coinImage2,
  }) {
    return Column(
      children: [
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(coinImage1, fit: BoxFit.contain),
            SizedBox(width: 15),
            Image.asset(coinImage2, fit: BoxFit.contain),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'USDT & BNB',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(' BEP20 Address', style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 10),
              Text(secretCode, textAlign: TextAlign.center),
            ],
          ),
        ),
        SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Image.asset(
              qrImage,
              height: 0.25.sh,
              width: 0.45.sw,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 25.sp),
        SizedBox(
          width: 200.sp,
          child: ElevatedButton(
            onPressed: () {
              // copyText(secretCode, context);
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150.w, 40.h),
              backgroundColor: const Color(0xff3F5FF2),
            ),
            child: Text(
              'Copy Address',
              style: TextStyle(
                fontFamily: "Roboto-normal",
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static showSettingBox({
    GestureTapCallback? onTap,
    required String text,
    required String image,
    String? dropDown,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(image, height: 35, width: 35),
                    SizedBox(width: 15),
                    Text(text),
                    Spacer(),
                    Image.asset(AppImage.rightarrow, height: 23, width: 23),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
