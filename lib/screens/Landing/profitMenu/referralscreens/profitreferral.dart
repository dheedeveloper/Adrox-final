import 'package:adrox/screens/Landing/profitMenu/referralscreens/directscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfitReferral extends StatefulWidget {
  const ProfitReferral({super.key});

  @override
  State<ProfitReferral> createState() => _ProfitReferralState();
}

class _ProfitReferralState extends State<ProfitReferral> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync:  this);
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
              width: 400.w,
              child: Row(
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.keyboard_backspace_rounded)),
                  Expanded(
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      controller: _tabController,
                      labelStyle:TextStyle(color: Colors.black, fontFamily: "Roboto-medium", fontSize: 14.sp),
                      unselectedLabelStyle: TextStyle(color: Colors.black, fontFamily: "Roboto-regular", fontSize: 14.sp),
                      indicatorColor: Color(0xff3F5FF2), // Blue underline
                      labelColor: Colors.black, // Selected text color
                      unselectedLabelColor: Colors.black, // Unselected text color
                      indicatorWeight: 3,
                      isScrollable: true,
                      tabs: const [
                        Tab(text: "Direct"),
                        Tab(text: "Level 2",),
                        Tab(text: "Level 3",),
                        Tab(text: "Level 4",),
                        Tab(text: "Level 5",),
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
                      DirectTab(),
                      DirectTab(),
                      DirectTab(),
                      DirectTab(),
                      DirectTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
