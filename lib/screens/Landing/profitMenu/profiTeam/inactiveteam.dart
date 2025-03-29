import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InActiveTeam extends StatefulWidget {
  const InActiveTeam({super.key});

  @override
  State<InActiveTeam> createState() => _InActiveTeamState();
}

class _InActiveTeamState extends State<InActiveTeam> {
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
                    Text("Total Lending",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                    Text("1300 ",style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
                  ],),
                SizedBox(width: 25.w,),
                VerticalDivider(indent: 15.h,endIndent: 15.h,),
                SizedBox(width: 20.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Inactive Count",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                    Text("100 ADX",style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
                  ],),
              ],
            ),),
          SizedBox(height: 20.h,),
          Row(
            children: [
              Text("Members Joined Details",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 15.sp,)),
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
          ),          SizedBox(height: 15.h,),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("50 ADX",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 14.sp,)),
                              Text("Executive",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 10.sp,)),
                            ],),
                          Spacer(),
                          Container(
                            height: 30.h,width: 100.h,decoration: BoxDecoration(color: Color(0xff212743),
                              borderRadius: BorderRadius.circular(10.r)),
                            child: Center(child: Text("KI3847987 ",style: TextStyle(color: Colors.white, fontFamily: "Roboto-regular", fontSize: 12.sp,))),),
                          SizedBox(width: 16.w,),
                          Text("11.30Am",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                        ],),
                    ],),),
              ),
            ),
          )
        ],),
    );
  }
}
