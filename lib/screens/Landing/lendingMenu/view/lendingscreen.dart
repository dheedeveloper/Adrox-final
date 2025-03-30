import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/core/utility/images.dart';

import 'package:adrox/core/utility/text.dart';
import 'package:adrox/screens/Landing/lendingMenu/controller/confirmlendingcontroller.dart';
import 'package:adrox/screens/Landing/lendingMenu/controller/lendingcontroller.dart';
import 'package:adrox/screens/Landing/lendingMenu/view/lendinghistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../homemenu/view/homescreen.dart';
import '../../profitMenu/profitscreen.dart';
import 'lendingtabsceen.dart';

class LendingScreen extends StatefulWidget {
  const LendingScreen({super.key});

  @override
  State<LendingScreen> createState() => _LendingScreenState();
}

class _LendingScreenState extends State<LendingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void apiCall() async {
    final lendingController = Provider.of<LendingController>(context, listen: false);
      await lendingController.lendingApiCall(DynamicStrings().token);
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<LendingController>(
        builder: (context, value, child) => value.isLoading || value.lendingData==null? DataLoader(): Scaffold(
          body:Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160.w,
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
        ),
      ),
    );
  }
}

