import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/screens/Landing/lendingMenu/controller/lendinghistorycontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/text.dart';



class LendingHistory extends StatefulWidget {
  const LendingHistory({super.key});

  @override
  State<LendingHistory> createState() => _LendingHistoryState();
}

class _LendingHistoryState extends State<LendingHistory> {

  void apiCall() async {
    final lendingController = Provider.of<LendingHistoryController>(context, listen: false);
    await lendingController.lendingHistoryApiCall(DynamicStrings().token);
  }


  @override
  void initState() {
    super.initState();
    apiCall();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LendingHistoryController>(
      builder: (context, value, child) => value.isLoading || value.lendingHistoryData==null? DataLoader() : Container(
        height: double.infinity,width: double.infinity.w,padding: EdgeInsets.all(20.h),
        child: Column(children: [
          Text("Today",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
          SizedBox(height: 12.h,),
          Container(
            height: 250.h,width: double.infinity,decoration: BoxDecoration(color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15.w)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("CORE",style: TextStyle(color: Colors.black, fontFamily: "Roboto-medium", fontSize: 20.sp,)),
                      Spacer(),
                      Text("1000 ADX",style: TextStyle(color: Colors.black, fontFamily: "Roboto-medium", fontSize: 20.sp,)),
                    ],),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 35.h,width: 170.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black38)),
                        child:Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "30 ", // Top text with smaller font size
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto-regular",
                                      fontSize: 15.sp, // Smaller font size
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Days", // Bottom text with larger font size
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Roboto-medium",
                                      fontSize: 15.sp, // Larger font size
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(color: Colors.black54,indent: 5.h,endIndent: 5.h,),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "5% ", // Top text with smaller font size
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto-regular",
                                      fontSize: 15.sp, // Smaller font size
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Bonus", // Bottom text with larger font size
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Roboto-medium",
                                      fontSize: 15.sp, // Larger font size
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 35.h,width: 80.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Color(0xff3ECD8B))),
                        child:Center(child: Text("Active",style: TextStyle(color: Color(0xff3ECD8B), fontFamily: "Roboto-medium", fontSize: 15.sp,))),
                      ),
                    ],),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Hash   ", // Top text with smaller font size
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto-regular",
                                fontSize: 13.sp, // Smaller font size
                              ),
                            ),
                            TextSpan(
                              text: "0X98DFY887SD8...FHJF", // Bottom text with larger font size
                              style: TextStyle(
                                color: Color(0xff3F5FF2),
                                fontFamily: "Roboto-regular",
                                fontSize: 13.sp, // Larger font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.navigate_next_rounded,color: Color(0xff3F5FF2),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "End on   ", // Top text with smaller font size
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Roboto-regular",
                            fontSize: 13.sp, // Smaller font size
                          ),
                        ),
                        TextSpan(
                          text: "11.30Am | 20 Apr 2025", // Bottom text with larger font size
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-medium",
                            fontSize: 13.sp, // Larger font size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.white,thickness: 1.2.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.5, // Increase the size (default is 1.0)
                        child: Checkbox(
                          visualDensity: VisualDensity.compact,
                          checkColor: const Color(0xff3F5FF2), // Tick color (white)
                          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.white; // When checked, fill color is white
                            }
                            return Color(0xffD9D9D9); // When unchecked, fill color is grey
                          }),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                              color: states.contains(MaterialState.selected)
                                  ? const Color(0xff3F5FF2) // Yellow border when checked
                                  : const Color(0xffD9D9D9), // Blue border when unchecked
                              width: 2, // Border width
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      Text("ReInvestment",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                      Spacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Started on   ", // Top text with smaller font size
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto-regular",
                                fontSize: 13.sp, // Smaller font size
                              ),
                            ),
                            TextSpan(
                              text: "11.30 Am", // Bottom text with larger font size
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto-medium",
                                fontSize: 13.sp, // Larger font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],),),
        ],),
      ),
    );
  }
}
