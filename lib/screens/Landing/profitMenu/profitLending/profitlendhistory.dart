import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/screens/Landing/profitMenu/controller/proflendhistorycontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/text.dart';

class ProfitLendHistory extends StatefulWidget {
  const ProfitLendHistory({super.key});

  @override
  State<ProfitLendHistory> createState() => _ProfitLendHistoryState();
}

class _ProfitLendHistoryState extends State<ProfitLendHistory> {

  String selectedValue = "Last Month";

  void apiCall(filterDate) async {
    final profLendHistoryController = Provider.of<ProfitLendHistoryController>(context, listen: false);
    await profLendHistoryController.profLendHistoryApiCall(DynamicStrings().token,filterDate);
  }

  @override
  void initState() {
    apiCall("all");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<ProfitLendHistoryController>(builder: (context, value, child) =>
        value.isLoading || value.profLendingHistoryData==null?DataLoader():Scaffold(
        body: Container(
          height: double.infinity,width: double.infinity.w,padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20.h),
                height: 110.h,width: double.infinity,decoration: BoxDecoration(color: Color(
                  0xffd7d7ec),
                  borderRadius: BorderRadius.circular(15.w)),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total lending pool",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                        Text(value.profLendingHistoryData!.data!.lending!.totalllendigpool.toString(),style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
                      ],),
                    SizedBox(width: 10.w,),
                    VerticalDivider(indent: 15.h,endIndent: 15.h,),
                    SizedBox(width: 20.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lending pools",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                        Text(value.profLendingHistoryData!.data!.lending!.lendingpools.toString(),style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
                      ],),
                  ],
                ),),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  Text("History",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 15.sp,)),
                  Spacer(),
                  SizedBox(height: 30.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r), // Border radius
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.all(Radius.circular(15.r)),
                            value: selectedValue,
                            style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 13.sp,),
                            items: [
                              DropdownMenuItem(
                                value: "Last Month",
                                child: Text("Last Month",
                                    style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 13.sp,)),
                              ),
                              DropdownMenuItem(
                                value: "Last Year",
                                child: Text("Last Year",
                                    style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 13.sp,)),
                              ),
                            ],
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),            SizedBox(height: 15.h,),
              Text("Today",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
              Expanded(
                child: ListView.builder(
                  itemCount: value.profLendingHistoryData!.data!.history!.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      height: 180.h,width: double.infinity,decoration: BoxDecoration(border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(15.w)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(value.profLendingHistoryData!.data!.history![index].name.toString(),style: TextStyle(color: Colors.black, fontFamily: "Roboto-medium", fontSize: 20.sp,)),
                              Spacer(),
                              Text(value.profLendingHistoryData!.data!.history![index].amount.toString(),style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 20.sp,)),
                            ],),
                          Row(
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
                                            text: value.profLendingHistoryData!.data!.history![index].daysDuration.toString(), // Top text with smaller font size
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto-regular",
                                              fontSize: 15.sp, // Smaller font size
                                            ),
                                          ),
                                          TextSpan(
                                            text: " Days", // Bottom text with larger font size
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontFamily: "Roboto-regular",
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
                                            text: value.profLendingHistoryData!.data!.history![index].profit.toString(), // Top text with smaller font size
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Roboto-regular",
                                              fontSize: 15.sp, // Smaller font size
                                            ),
                                          ),
                                          TextSpan(
                                            text: " Bonus", // Bottom text with larger font size
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontFamily: "Roboto-regular",
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
                          Row(
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
                                      text: value.profLendingHistoryData!.data!.history![index].hashId.toString(), // Bottom text with larger font size
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
                          RichText(
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
                                  text: value.profLendingHistoryData!.data!.history![index].endDate.toString(), // Bottom text with larger font size
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Roboto-regular",
                                    fontSize: 13.sp, // Larger font size
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],),),
                  ),
                ),
              )
            ],),
        ),
      ),
    ));
  }
}
