import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectTab extends StatefulWidget {
  const DirectTab({super.key});

  @override
  State<DirectTab> createState() => _DirectTabState();
}

class _DirectTabState extends State<DirectTab> {

  String selectedValue = "Last Month";

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text("Total Pool",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                    Text("100000 USDT",style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
                  ],),
                SizedBox(width: 15.w,),
                VerticalDivider(indent: 15.h,endIndent: 15.h,),
                SizedBox(width: 20.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Members",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                    Text("100 ADX",style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
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
              itemCount: 6,
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
                          Text("50 ADX",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 14.sp,)),
                          Text("Direct Bonus",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 10.sp,)),
                        ],),
                      SizedBox(width: 16.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("KJ4599DF",style: TextStyle(color: Color(0xff3F5FF2), fontFamily: "Roboto-regular", fontSize: 14.sp,)),
                          Text("Abu",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 10.sp,)),
                        ],),
                      Spacer(),
                      Text("11.30Am",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                    ],),),
              ),
            ),
          )
        ],),
    );
  }
}
