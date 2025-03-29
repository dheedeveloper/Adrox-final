import 'package:adrox/core/utility/images.dart';

import 'package:adrox/core/utility/text.dart';
import 'package:adrox/screens/Landing/lendingMenu/lendinghistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../homemenu/homescreen.dart';
import '../profitMenu/profitscreen.dart';

class LendingScreen extends StatefulWidget {
  const LendingScreen({super.key});

  @override
  State<LendingScreen> createState() => _LendingScreenState();
}

class _LendingScreenState extends State<LendingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
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
      child: Scaffold(
        body: _selectedIndex == 0
            ? const HomeScreen()
            : _selectedIndex == 1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180.w,
                        child: TabBar(
                          controller: _tabController,
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-medium",
                            fontSize: 14.sp,
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-regular",
                            fontSize: 14.sp,
                          ),
                          automaticIndicatorColorAdjustment: true,
                          tabAlignment: TabAlignment.center,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff3F5FF2), // Blue underline
                                width: 2, // Thickness of underline
                              ),
                            ),
                          ),
                          indicatorAnimation: TabIndicatorAnimation.elastic,
                          labelColor: Colors.black, // Selected text color
                          unselectedLabelColor:
                              Colors.black, // Unselected text color
                          tabs: const [
                            Tab(text: "Lending"),
                            Tab(text: "History"),
                          ],
                        ),
                      ),

                      /// TabBarView
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            LendingTabScreen(),
                            LendingHistory()
                          ],
                        ),
                      ),
                    ],
                  )
                : ProfitHomeTab(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            unselectedLabelStyle: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto-medium",
                fontSize: 12.sp),
            selectedLabelStyle: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto-medium",
                fontSize: 12.sp),
            selectedItemColor: Colors.blue, // Active tab color
            unselectedItemColor: Colors.black54,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                    height: 21,
                    width: 21,
                    _selectedIndex == 0
                        ? AppImage.homeSelect
                        : AppImage.homeDis),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    height: 21,
                    width: 21,
                    _selectedIndex == 1
                        ? AppImage.lendingSelect
                        : AppImage.lendingDis),
                label: 'Lending',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                    height: 21,
                    width: 21,
                    _selectedIndex == 2
                        ? AppImage.profitSelect
                        : AppImage.profitDis),
                label: 'Profit',
              ),
            ]),
      ),
    );
  }
}

class LendingTabScreen extends StatefulWidget {
  const LendingTabScreen({super.key});

  @override
  State<LendingTabScreen> createState() => _LendingTabScreenState();
}

class _LendingTabScreenState extends State<LendingTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity.w,
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.h),
            height: 110.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15.w)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lending",
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: "Roboto-medium",
                      fontSize: 12.sp,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("CORE",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto-medium",
                          fontSize: 20.sp,
                        )),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      height: 35.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black38)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "30 ", // Top text with smaller font size
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto-regular",
                                    fontSize: 15.sp, // Smaller font size
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Days", // Bottom text with larger font size
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "Roboto-medium",
                                    fontSize: 15.sp, // Larger font size
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
                                  text:
                                      "5% ", // Top text with smaller font size
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto-regular",
                                    fontSize: 15.sp, // Smaller font size
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Bonus", // Bottom text with larger font size
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
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
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
                      Text("Pool",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Roboto-medium",
                            fontSize: 14.sp,
                          )),
                      Spacer(),
                      Image.asset(AppImage.purse),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("250.02 USDT",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Roboto-medium",
                            fontSize: 14.sp,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("CORE",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-medium",
                            fontSize: 20.sp,
                          )),
                      Spacer(),
                      Text("USDT",
                          style: TextStyle(
                            color: Color(0xff009393),
                            fontFamily: "Roboto-medium",
                            fontSize: 20.sp,
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Image.asset(AppImage.Usdt)
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
                      Text("BNB Required   ",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Roboto-regular",
                            fontSize: 12.sp,
                          )),
                      Text("0.01 BNB",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Roboto-medium",
                            fontSize: 12.sp,
                          )),
                      Spacer(),
                      Image.asset(AppImage.purse),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("0.03 BNB",
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Roboto-medium",
                            fontSize: 12.sp,
                          )),
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
            onPressed: () {},
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
          Text(StringValues.lending,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Roboto-regular",
                  fontSize: 12.sp,
                  height: 1.4.h)),
        ],
      ),
    );
  }
}
