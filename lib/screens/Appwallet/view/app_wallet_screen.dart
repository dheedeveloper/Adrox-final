import 'package:adrox/MemberTrees/Member_Screen.dart';
import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/utility/Custom_History.dart';
import 'package:adrox/core/utility/Navigation_Helper.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Appwallet/view/internal_Transfer_screens.dart';
import 'package:adrox/screens/Appwallet/view/lendingPoolRequest_Screens.dart';
import 'package:adrox/screens/Appwallet/view/movetoDex_Screens.dart';
import 'package:adrox/screens/Appwallet/view/swapUsdt_Screend.dart';
import 'package:adrox/screens/Settings/view/Settings_Screens.dart';
import 'package:flutter/material.dart';

class AppWalletScreen extends StatefulWidget {
  const AppWalletScreen({super.key});

  @override
  State<AppWalletScreen> createState() => _AppWalletScreenState();
}

class _AppWalletScreenState extends State<AppWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.walletContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            top: 15,
                            bottom: 15,
                            left: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "P2P",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        NavigationHelper.AnimatedNavigation(
                                          context: context,
                                          page: InternalTransferScreens(),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: AppColors.walletSend,
                                      ),
                                      child: Text(
                                        "Send",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text('ADX | USDT'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          buildWalletCard(
                            ontap: () {
                              NavigationHelper.AnimatedNavigation(
                                context: context,
                                page: SwapusdtScreend(),
                              );
                            },
                            currency: "ADX",
                            bgColor: AppColors.walletContainer2,
                            amount: "2335",
                            actionText: "Swap USDT",
                            image: AppImage.Adx,
                            buttonColor: AppColors.swapButton,
                          ),
                          SizedBox(width: 20),
                          buildWalletCard(
                            ontap: () {
                              NavigationHelper.AnimatedNavigation(
                                context: context,
                                page: MovetodexScreens(),
                              );
                            },
                            currency: "USDT",
                            bgColor: AppColors.walletContainer2,
                            amount: "900",
                            actionText: "Move to DeX",
                            image: AppImage.Usdt,
                            buttonColor: AppColors.walletButton,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          NavigationHelper.AnimatedNavigation(
                            context: context,
                            page: LendingpoolrequestScreens(),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xffEDF0FB)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Lending Pool Request'),
                                Image.asset(
                                  AppImage.rightarrow,
                                  height: 23,
                                  width: 23,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                CustomHistory.buildTransactionTile(
                  day: 'Today',
                  filterTitle: 'Last Month',
                  historyTitle: 'Recents',
                  title: '150 USDT',
                  subtitle: '3000ADX to 150USDT',
                  time: '11.30Am',
                  icon: Icons.swap_horiz,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    NavigationHelper.AnimatedNavigation(
                      context: context,
                      page: SettingsScreens(),
                    );
                  },
                  child: Text('Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    NavigationHelper.AnimatedNavigation(
                      context: context,
                      page: MemberScreen(),
                    );
                  },
                  child: Text('Settings'),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: 3,
        //   backgroundColor: Colors.white,
        //   selectedItemColor: Colors.blue,
        //   unselectedIconTheme: IconThemeData(color: Color(0xff959595)),
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.attach_money),
        //       label: "Lending",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.trending_up),
        //       label: "Profit",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.account_balance_wallet),
        //       label: "Wallet",
        //     ),
        //   ],
        // ),
      ),
    );
  }

  buildWalletCard({
    required amount,
    required currency,
    required actionText,
    required bgColor,
    String? image,
    Color? buttonColor,
    required VoidCallback ontap,
  }) {
    return Expanded(
      child: Container(
        height: 200,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image ?? '',
              height: 50,
              width: 47,
            ),
            SizedBox(height: 10),
            Text(
              amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: buttonColor,
              ),
            ),
            Text(currency, style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: ontap,
              child: Text(
                actionText,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                elevation: 0,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTransactionTile({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
  }) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(time),
    );
  }
}
