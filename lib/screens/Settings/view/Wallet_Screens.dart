import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Navigation_Helper.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Dexwallet/View/dexwallet_screens.dart';
import 'package:adrox/screens/Tabs_Screens/AppAndDex_Tabvies.dart';
import 'package:flutter/material.dart';

class WalletScreens extends StatefulWidget {
  const WalletScreens({super.key});

  @override
  State<WalletScreens> createState() => _WalletScreensState();
}

class _WalletScreensState extends State<WalletScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Wallets', usePaddedLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff3ECD8B)),
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff3ECD8B).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.star_border_purple500_outlined),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  'Kumar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 0.2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff3ECD8B),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Primary',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'HJDF8DF8U8U8U8U',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Image.asset(
                                  AppImage.copy,
                                  height: 19,
                                  width: 19,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff3ECD8B).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(''),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  'Barath',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'HJDF8DF8U8U8U8U',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Image.asset(
                                  AppImage.copy,
                                  height: 19,
                                  width: 19,
                                ),
                              ],
                            ),
                            trailing: Image.asset(
                              AppImage.delete,
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBoxes.button(
                          buttonColor: Color(0xffE46364),
                          size: 140,
                          onTap: () {},
                          text: 'Logout',
                        ),
                        CustomBoxes.button(
                          size: 197,
                          onTap: () {},
                          text: 'Add Wallet',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
