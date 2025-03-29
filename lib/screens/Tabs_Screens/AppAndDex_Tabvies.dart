import 'package:adrox/core/utility/CustomTabView.dart';
import 'package:flutter/material.dart';
import '../../core/utility/images.dart' show AppImage;
import '../Appwallet/view/app_wallet_screen.dart';
import '../Dexwallet/View/dexwallet_screens.dart' show DexwalletScreens;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppanddexTabvies extends StatefulWidget {
  const AppanddexTabvies({super.key});

  @override
  State<AppanddexTabvies> createState() => _AppanddexTabviesState();
}

class _AppanddexTabviesState extends State<AppanddexTabvies>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CommonTabView(
          tabController: _tabController,
          tabs: const ["App Wallet", "DeX Wallet"],
          views: const [AppWalletScreen(), DexwalletScreens()],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //
      //   elevation: 2,
      //
      //   selectedItemColor: Colors.blue,
      //
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         _selectedIndex == 0 ? AppImage.appStore : AppImage.Adx,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         _selectedIndex == 1 ? AppImage.appStore : AppImage.Adx,
      //       ),
      //       label: 'Lending',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         _selectedIndex == 2 ? AppImage.appStore : AppImage.Adx,
      //       ),
      //       label: 'Profit',
      //     ),
      //   ],
      // ),
    );
  }
}
