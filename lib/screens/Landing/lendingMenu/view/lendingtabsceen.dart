import 'dart:convert';
import 'package:adrox/core/constants/apiconstants.dart';
import 'package:http/http.dart' as http;
import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/core/utility/Custom_text.dart';
import 'package:adrox/screens/Landing/lendingMenu/model/confirmlendingmodel.dart';
import 'package:adrox/screens/Landing/lendingMenu/view/lendinghistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utility/images.dart';
import '../../../../core/utility/text.dart';
import '../controller/confirmlendingcontroller.dart';
import '../controller/lendingcontroller.dart';

class LendingTabScreen extends StatefulWidget {
  const LendingTabScreen({super.key});

  @override
  State<LendingTabScreen> createState() => _LendingTabScreenState();
}

class _LendingTabScreenState extends State<LendingTabScreen> {

  bool isExpanded = false;
  final amtController = TextEditingController();

  startLending(packageId,userAmount)async{
    final confirmLending = Provider.of<ConfirmLendingController>(context, listen: false);
    await confirmLending.confirmLendingApiCall(DynamicStrings().token,packageId,userAmount);
    amtController.clear();
  }

  ConfirmLendingModel confirmLendingModel = ConfirmLendingModel();
  bool confirmFlag= false;

  Future<void> lendingConfirmation(packageId, userAmt) async {
    String url = ApiConstants.lendingConfirm;
    setState(() {
      confirmFlag = true;
    });

    // Headers
    Map<String, String> headers = {
      "Authorization": DynamicStrings().token,
      "Content-Type": "application/json"
    };

    // Request body
    Map<String, dynamic> requestBody = {
      "package_id": packageId,
      "user_amount": userAmt
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody),
      );
      print("Url >>>>>>> $url");
      print("Request >>>>>>> $requestBody");

      if (response.statusCode == 200) {
        print("Success: ${response.body}");

        // Parse the response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        confirmLendingModel = ConfirmLendingModel.fromJson(responseData); // Assuming you have a fromJson method

        setState(() {
          confirmFlag = false;
        });

        if (confirmLendingModel.status == true) {
          print("Working >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        } else {
          CustomText.instance.showToastFailure(confirmLendingModel.message.toString());
        }
      } else {
        print("Error: ${response.statusCode}, ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  int selectedIndex=0;
  int minimum=0;
  int maximum=0;


  @override
  Widget build(BuildContext context) {
    return Consumer<LendingController>(builder: (context, value, child) => Scaffold(
      resizeToAvoidBottomInset: true,
      body: Consumer<ConfirmLendingController>(
        builder: (context, confirmValue, child) => confirmValue.isLoading || confirmFlag==true? DataLoader() : Container(
          height: double.infinity.h,
          width: double.infinity.w,
          padding: EdgeInsets.all(20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.h),
                  height: isExpanded ? 200.h : 110.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lending",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: "Roboto-medium",
                          fontSize: 12.sp,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: !isExpanded ? 1 : value.lendingData!.data!.packageResults!.length,
                          itemExtent: 50.h,
                          itemBuilder: (context, index) {
                            int displayIndex = isExpanded ? index : selectedIndex; // ✅ Show selected index when collapsed

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  isExpanded = !isExpanded;
                                  minimum=int.parse(value.lendingData!.data!.packageResults![selectedIndex].minimum.toString());
                                  maximum=int.parse(value.lendingData!.data!.packageResults![selectedIndex].maximum.toString());
                                });
                                print("SelectedIndex - $selectedIndex");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    value.lendingData!.data!.packageResults![displayIndex].packageName.toString(), // ✅ Show correct package name
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto-medium",
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 35.h,
                                    width: 160.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(color: Colors.black38),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "${value.lendingData!.data!.packageResults![displayIndex].daysDuration.toString()} ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Roboto-regular",
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Days",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: "Roboto-medium",
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.black54,
                                          indent: 5.h,
                                          endIndent: 5.h,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "${value.lendingData!.data!.packageResults![displayIndex].roi.toString()}% ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Roboto-regular",
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Bonus",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: "Roboto-medium",
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  index == 0
                                      ? Container(
                                    height: 30.h,
                                    width: 30.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.grey.shade300,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isExpanded = !isExpanded; // ✅ Toggle expansion
                                        });
                                      },
                                      icon: Icon(
                                        size: 18.sp,
                                        isExpanded
                                            ? Icons.keyboard_arrow_up_rounded
                                            : Icons.keyboard_arrow_down_rounded,
                                      ),
                                    ),
                                  )
                                      : SizedBox(width: 35.w),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                 Column(
                  children: [
                    Container(
                      height: 140.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Pool",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-medium",
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: Image.asset(AppImage.purse),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "${value.lendingData!.data!.balance!.walletUsdSiteUsdTotal.toString()} USDT",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-medium",
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width:90.w,height: 30.h,
                                  child: TextField(
                                    cursorColor: Colors.transparent,
                                    keyboardType: TextInputType.number,
                                    controller: amtController,
                                    decoration: InputDecoration(
                                        hintText: "Enter amount",
                                        hintStyle: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black45,
                                          fontFamily: "Roboto-regular",
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 17.h, horizontal: 12.w),
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
                                ),
                                Spacer(),
                                Text(
                                  "USDT",
                                  style: TextStyle(
                                    color: Color(0xff009393),
                                    fontFamily: "Roboto-medium",
                                    fontSize: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                SizedBox(
                                  height: 30.h,
                                  width: 30.h,
                                  child: Image.asset(AppImage.Usdt),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1.2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Minimum - ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-regular",
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(value.lendingData!.data!.packageResults![selectedIndex].minimum.toString(),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-medium",
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Maximum - ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-regular",
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(value.lendingData!.data!.packageResults![selectedIndex].maximum.toString(),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-medium",
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "BNB Required   ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-regular",
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  "${value.lendingData!.data!.lendingContent!.gasFee.toString()} BNB",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-medium",
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 20.h,
                                  width: 20.h,
                                  child: Image.asset(AppImage.purse),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "${value.lendingData!.data!.balance!.walletUsdSiteUsdBnbUsdTotal.toString()} BNB",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-medium",
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if(amtController.text.isNotEmpty){
                              // startLending(value.lendingData!.data!.packageResults![selectedIndex].id.toString(),
                              //     amtController.text);
                            lendingConfirmation(value.lendingData!.data!.packageResults![selectedIndex].id.toString(),
                                amtController.text);
                            amtController.clear();
                          }
                          else{
                            CustomText.instance.showToastFailure("Please enter amount");
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(320.w, 40.h),
                          backgroundColor: const Color(0xff3F5FF2),
                        ),
                        child: Text(
                          "Start Lending",
                          style: TextStyle(
                            fontFamily: "Roboto-regular",
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(value.lendingData!.data!.lendingContent!.content.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-regular",
                            fontSize: 12.sp,
                            height: 1.4.h)),
                  ],
                )
              ],
            )
          ),
        ),
      ),
    )
    );
  }
}