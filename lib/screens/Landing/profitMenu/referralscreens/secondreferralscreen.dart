import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/screens/Landing/profitMenu/controller/secondreferralcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/text.dart';

class SecondReferralScreen extends StatefulWidget {
  const SecondReferralScreen({super.key});

  @override
  State<SecondReferralScreen> createState() => _SecondReferralScreenState();
}

class _SecondReferralScreenState extends State<SecondReferralScreen> {
  String selectedValue = "Last Month";

  void apiCall(filterDate,filterLevel) async {
    final secondRefController = Provider.of<SecondReferralController>(context, listen: false);
    await secondRefController.secondRefApiCall(DynamicStrings().token,filterDate,filterLevel);
  }

  @override
  void initState() {
    apiCall("all","2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SecondReferralController>(
      builder: (context, value, child) => value.isLoading || value.secondRefData==null ? DataLoader() : Container(
        height: double.infinity,width: double.infinity.w,padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.h),
              height: 110.h,width: double.infinity,decoration: BoxDecoration(color: const Color(
                0xffd7d7ec),
                borderRadius: BorderRadius.circular(15.w)),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Direct Bonus",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                      Text(value.secondRefData!.data!.lending!.totall2Ndlevelbonus.toString(),style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
                    ],),
                  SizedBox(width: 15.w,),
                  VerticalDivider(indent: 15.h,endIndent: 15.h,),
                  SizedBox(width: 20.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Direct Members",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                      Text(value.secondRefData!.data!.lending!.totall2Ndlevelmembers.toString(),style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
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
            ),
            SizedBox(height: 15.h,),
            Text("Today",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
            Expanded(
              child: ListView.builder(
                itemCount: value.secondRefData!.data!.history!.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                    height: 70.h,width: double.infinity,decoration: BoxDecoration(border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(15.w)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 40.h,width: 40.h,decoration: BoxDecoration(color: Colors.lightGreen.shade50,
                            borderRadius: BorderRadius.circular(10.r)),
                            child: Icon(Icons.arrow_downward_rounded,color: Colors.green.shade600,)),
                        SizedBox(width: 16.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value.secondRefData!.data!.history![index].amount.toString(),style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                            Text(value.secondRefData!.data!.history![index].description.toString(),style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 10.sp,)),
                          ],),
                        SizedBox(width: 10.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value.secondRefData!.data!.history![index].referralId.toString(),style: TextStyle(color: Color(0xff3F5FF2), fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                            Text(value.secondRefData!.data!.history![index].sponsorUsername.toString(),style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 10.sp,)),
                          ],),
                        Spacer(),
                        Text(value.secondRefData!.data!.history![index].time!.toString().split(" ").first,style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                      ],),),
                ),
              ),
            )
          ],),
      ),
    );
  }
}
