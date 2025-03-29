import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTabView extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;
  final List<Widget> views;

  const CommonTabView({
    Key? key,
    required this.tabController,
    required this.tabs,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200.w,
            child: TabBar(
              dividerColor: Colors.transparent,
              controller: tabController,
              indicatorWeight: 0.1,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontFamily: "Roboto-normal",
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
                fontFamily: "Roboto-lite",
                fontSize: 14,
              ),
              indicatorColor: const Color(0xff3F5FF2),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: tabs.map((tab) => Tab(text: tab)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: views),
          ),
        ],
      ),

    );
  }
}
