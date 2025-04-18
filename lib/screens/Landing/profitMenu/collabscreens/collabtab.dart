import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/screens/Landing/profitMenu/controller/collabcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/text.dart';

class CollabScreen extends StatefulWidget {
  const CollabScreen({super.key});

  @override
  State<CollabScreen> createState() => _CollabScreenState();
}

class _CollabScreenState extends State<CollabScreen> {
  String selectedValue = "Last Month";

  void apiCall(filterDate) async {
    final collabController = Provider.of<CollabController>(context, listen: false);
    await collabController.collabApiCall(DynamicStrings().token,filterDate);
  }

  @override
  void initState() {
    apiCall("all");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<CollabController>(
      builder: (context, value, child) => value.isLoading || value.collabData==null?DataLoader() : Scaffold(
        appBar: AppBar(leading: IconButton(icon: Icon(Icons.keyboard_backspace_rounded), onPressed: () {
          Navigator.pop(context);
        },),
          title: Text("Collab",style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 16.sp,)),),
        body: Container(
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
                        Text("Total Collab Incentives",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                        Text(value.collabData!.data!.collab!.totalcollabincentives.toString(),style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
                      ],),
                    VerticalDivider(indent: 15.h,endIndent: 15.h,),
                    SizedBox(width: 20.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Pool Match",style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                        Text(value.collabData!.data!.collab!.currentpoolmatch.toString(),style: TextStyle(color: Color(0xff41418E), fontFamily: "Roboto-regular", fontSize: 18.sp,)),
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
                  itemCount: value.collabData!.data!.history!.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                      height: 225.h,width: double.infinity,decoration: BoxDecoration(border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(15.w)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
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
                                  Text(value.collabData!.data!.history![index].amount.toString(),style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 14.sp,)),
                                  Text(value.collabData!.data!.history![index].rankname.toString(),style: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 10.sp,)),
                                ],),
                              const Spacer(),
                              Text(value.collabData!.data!.history![index].date.toString(),style: TextStyle(color: Colors.black54, fontFamily: "Roboto-regular", fontSize: 12.sp,)),
                            ],),
                          const Divider(),
                          SizedBox(height: 4.h,),
                          Center(
                            child: RichText(
                              text:  TextSpan(
                                style: TextStyle(fontSize: 14.sp, color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: value.collabData!.data!.history![index].overallRankeligible.toString(),
                                    style: TextStyle(fontSize: 14.sp, fontFamily: "Roboto-regular",fontWeight: FontWeight.bold, color: Color(0xff3F5FF2)),
                                  ),
                                  TextSpan(text: " Pool Matching",
                                    style: TextStyle(fontSize: 14.sp, fontFamily: "Roboto-regular", color: Colors.black),),
                                ],
                              ),
                            ),
                          ),
                          CustomPaint(
                              painter: TreePainter(),
                              child: Column(
                                children: [
                                  SizedBox(height: 50.h), // Space for lines
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildAmountBox(value.collabData!.data!.history![index].leftlegAmount.toString()),
                                      const SizedBox(width: 40),
                                      buildAmountBox(value.collabData!.data!.history![index].riightlegAmount.toString()),
                                    ],
                                  ),
                                ],
                              )),
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


Widget buildAmountBox(String amount) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 18.w),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black45),
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Text(
      amount,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold,fontFamily: "Roboto-regular",),
    ),
  );
}


class TreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    final double centerX = size.width / 2;
    const double startY = 8;
    const double midY = 27; // First downward curve
    const double curveY = 22; // Midpoint of the curve
    const double endY = 70; // Bottom position where boxes are placed

    final double leftX = centerX -57;
    final double rightX = centerX + 57;

    // Draw vertical line down from top
    path.moveTo(centerX, startY);
    path.lineTo(centerX, midY);

    // Draw curved connector to the left box
    path.moveTo(centerX, midY);
    path.quadraticBezierTo(centerX - 70, curveY, leftX, endY);

    // Draw curved connector to the right box
    path.moveTo(centerX, midY);
    path.quadraticBezierTo(centerX + 70, curveY, rightX, endY);

    // Draw on canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}