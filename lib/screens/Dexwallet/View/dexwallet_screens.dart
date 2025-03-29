import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:adrox/core/utility/Custom_text.dart';
import 'package:adrox/core/utility/Navigation_Helper.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Appwallet/view/app_wallet_screen.dart';
import 'package:adrox/screens/Dexwallet/View/Send_Screens.dart';
import 'package:adrox/screens/Dexwallet/View/history_Screens.dart';
import 'package:adrox/screens/Dexwallet/View/my_Coins_Screens.dart';
import 'package:adrox/screens/Dexwallet/View/swap_Coin_screens.dart';
import 'package:adrox/screens/Dexwallet/View/swap_screens.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ReceiveCoins_Screens.dart';

class DexwalletScreens extends StatefulWidget {
  const DexwalletScreens({super.key});

  @override
  State<DexwalletScreens> createState() => _DexwalletScreensState();
}

class _DexwalletScreensState extends State<DexwalletScreens> {
  List actionRowTitle = ['Send', 'Receive', 'My Coins', 'Swap', 'History'];
  List actionRowImage = [
    AppImage.send,
    AppImage.receive,
    AppImage.myCoins,
    AppImage.swap,
    AppImage.history,
  ];
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
                // SizedBox(height: 5),
                // CustomAppBar().pageTitle(
                //   currentScreen: 'DeX Wallet',
                //   firstTitle: 'App Wallet',
                //   secondTitle: 'DeX Wallet',
                //   dexOnTap: () {},
                //   appOnTap: () {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => AppWalletScreen(),
                //       ),
                //     );
                //   },
                //
                //   context: context,
                // ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text('Hj3934 Balance')),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          '\$523.33',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 0,
                        color: AppColors.dividerColor.withOpacity(0.10),
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < actionRowTitle.length; i++)
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      switch (i) {
                                        case 0:
                                          {
                                            NavigationHelper.AnimatedNavigation(
                                              context: context,
                                              page: SendScreens(),
                                            );
                                          }
                                          break;
                                        case 1:
                                          {
                                            NavigationHelper.AnimatedNavigation(
                                              context: context,
                                              page: ReceivecoinsScreens(),
                                            );
                                          }
                                          break;
                                        case 2:
                                          {
                                            NavigationHelper.AnimatedNavigation(
                                              context: context,
                                              page: MyCoinsScreens(),
                                            );
                                          }
                                          break;
                                        case 3:
                                          {
                                            NavigationHelper.AnimatedNavigation(
                                              context: context,
                                              page: SwapScreens(),
                                            );
                                          }
                                          break;
                                        case 4:
                                          {
                                            NavigationHelper.AnimatedNavigation(
                                              context: context,
                                              page: HistoryScreens(),
                                            );
                                          }
                                          break;
                                        default:
                                      }
                                    },
                                    child: Container(
                                      height: 55.sp,
                                      width: 0.15.sw,
                                      decoration: BoxDecoration(
                                        color: AppColors.actionRow,
                                        borderRadius: BorderRadius.circular(
                                          30.sp,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          actionRowImage[i].toString(),
                                          fit: BoxFit.cover,
                                          height: (i == 0) ? 18.sp : 23.sp,
                                          width: (i == 0) ? 18.sp : 23.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(actionRowTitle[i].toString()),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        thickness: 0,
                        color: AppColors.dividerColor.withOpacity(0.10),
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Coins',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CustomText.instance.showAssetText(
                        price: '+ 0.0023',
                        subtitle: '\$2,365.16',
                        image: AppImage.Usdt,
                        title: 'USDT',
                      ),
                      CustomText.instance.showAssetText(
                        price: '+ 0.0023',
                        subtitle: '\$2,365.16',
                        image: AppImage.Adx,
                        title: 'Adx',
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            NavigationHelper.AnimatedNavigationdown(
                              context: context,
                              page: SwapCoinScreens(),
                            );
                          },
                          child: Text(
                            'View More',
                            style: TextStyle(
                              color: Colors.blue.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
