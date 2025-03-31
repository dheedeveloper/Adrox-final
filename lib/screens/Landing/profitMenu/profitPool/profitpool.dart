import 'package:adrox/screens/Landing/profitMenu/profitPool/leftpool.dart';
import 'package:adrox/screens/Landing/profitMenu/profitPool/rightpool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfitPool extends StatefulWidget {
  const ProfitPool({super.key});

  @override
  State<ProfitPool> createState() => _ProfitPoolState();
}

class _ProfitPoolState extends State<ProfitPool> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300.w,
              child: Row(
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.keyboard_backspace_rounded)),
                  Expanded(
                    child: TabBar(
                      controller: _tabController,
                      labelStyle:TextStyle(color: Colors.black, fontFamily: "Roboto-medium", fontSize: 14.sp),
                      unselectedLabelStyle: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 14.sp),
                      indicatorColor: Color(0xff3F5FF2), // Blue underline
                      labelColor: Colors.black, // Selected text color
                      unselectedLabelColor: Colors.black, // Unselected text color
                      indicatorWeight: 3, // Thickness of underline
                      tabs: const [
                        Tab(text: "Left Pool"),
                        Tab(text: "Right Pool",),
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
                children: const [
                  LeftPool(),
                  RightPool()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



