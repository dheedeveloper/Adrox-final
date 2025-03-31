import 'package:adrox/screens/Landing/profitMenu/profiTeam/inactiveteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'activeteam.dart';

class ProfitTeam extends StatefulWidget {
  const ProfitTeam({super.key});

  @override
  State<ProfitTeam> createState() => _ProfitTeamState();
}

class _ProfitTeamState extends State<ProfitTeam> with SingleTickerProviderStateMixin{

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
                        Tab(text: "Active Team"),
                        Tab(text: "Inactive Team",),
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
                  ActiveTeam(),
                  InActiveTeam()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


