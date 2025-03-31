import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/screens/Landing/profitMenu/controller/profitlendingcontroller.dart';
import 'package:adrox/screens/Landing/profitMenu/profitLending/profitlendhistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/text.dart';

class LendingBonus extends StatefulWidget {
  const LendingBonus({super.key});

  @override
  State<LendingBonus> createState() => _LendingBonusState();
}

class _LendingBonusState extends State<LendingBonus>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void apiCall() async {
    final profitLendingController = Provider.of<ProfitLendingController>(context, listen: false);
    await profitLendingController.profitLendingApiCall(DynamicStrings().token);
  }

  @override
  void initState() {
    super.initState();
    apiCall();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ProfitLendingController>(builder: (context, value, child) =>
          value.isLoading||value.profitLendingData==null?DataLoader():Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300.w,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.keyboard_backspace_rounded)),
                    Expanded(
                      child: TabBar(
                        controller: _tabController,
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-medium",
                            fontSize: 14.sp),
                        unselectedLabelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-regular",
                            fontSize: 14.sp),
                        indicatorColor: const Color(0xff3F5FF2), // Blue underline
                        labelColor: Colors.black, // Selected text color
                        unselectedLabelColor:
                            Colors.black, // Unselected text color
                        indicatorWeight: 3, // Thickness of underline
                        tabs: const [
                          Tab(text: "Lending Bonus"),
                          Tab(
                            text: "Lending History",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// TabBarView
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [LendingBonusTab(), ProfitLendHistory()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LendingBonusTab extends StatefulWidget {
  const LendingBonusTab({super.key});

  @override
  State<LendingBonusTab> createState() => _LendingBonusTabState();
}

class _LendingBonusTabState extends State<LendingBonusTab> {
  String selectedValue = "Last Month";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity.w,
      padding: EdgeInsets.all(20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.h),
            height: 110.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xffd7d7ec),
                borderRadius: BorderRadius.circular(15.w)),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Today Bonus",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: "Roboto-regular",
                          fontSize: 12.sp,
                        )),
                    Text("100 ADX",
                        style: TextStyle(
                          color: Color(0xff41418E),
                          fontFamily: "Roboto-regular",
                          fontSize: 18.sp,
                        )),
                  ],
                ),
                SizedBox(
                  width: 50.w,
                ),
                VerticalDivider(
                  indent: 15.h,
                  endIndent: 15.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Today Bonus",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: "Roboto-regular",
                          fontSize: 12.sp,
                        )),
                    Text("100 ADX",
                        style: TextStyle(
                          color: Color(0xff41418E),
                          fontFamily: "Roboto-regular",
                          fontSize: 18.sp,
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Text("History",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto-regular",
                    fontSize: 15.sp,
                  )),
              Spacer(),
              SizedBox(
                height: 30.h,
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
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto-regular",
                          fontSize: 13.sp,
                        ),
                        items: [
                          DropdownMenuItem(
                            value: "Last Month",
                            child: Text("Last Month",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto-regular",
                                  fontSize: 13.sp,
                                )),
                          ),
                          DropdownMenuItem(
                            value: "Last Year",
                            child: Text("Last Year",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto-regular",
                                  fontSize: 13.sp,
                                )),
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
          SizedBox(
            height: 15.h,
          ),
          Text("Today",
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Roboto-regular",
                fontSize: 12.sp,
              )),
          Expanded(
            child: ListView.builder(
              itemExtent: 60.h,
              itemCount: 6,
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen.shade50,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green.shade600,
                      )),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("50 ADX",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-regular",
                            fontSize: 14.sp,
                          )),
                      Text("Lending Bonus from 5000ADX",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-regular",
                            fontSize: 10.sp,
                          )),
                    ],
                  ),
                  Spacer(),
                  Text("11.30Am",
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: "Roboto-regular",
                        fontSize: 12.sp,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
