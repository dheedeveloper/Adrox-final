import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Navigation_Helper.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Dexwallet/View/dexwallet_screens.dart';
import 'package:adrox/screens/Settings/view/Support_Screens.dart';
import 'package:adrox/screens/Settings/view/TermsandCondition_Screens.dart';
import 'package:adrox/screens/Settings/view/Wallet_Screens.dart';
import 'package:adrox/screens/Tabs_Screens/AppAndDex_Tabvies.dart';
import 'package:flutter/material.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  //**************When finish all screen remove imagelist merge eith imagescreens widgets*************
  List<String> imageList = [
    AppImage.fb,
    AppImage.x,
    AppImage.insta,
    AppImage.messenger,
    AppImage.youtube,
  ];

  Map<String, Widget> imageScreens = {
    // AppImage.fb:  (),
    // AppImage.x:  (),
    // AppImage.insta:  (),
    // AppImage.messenger:  (),
    // AppImage.youtube:  (),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Settings',
        Centertittle: false,
        usePaddedLeading: true,
        actions: [
          Image.asset(AppImage.mail, height: 25, width: 19),
          SizedBox(width: 20),
          Image.asset(AppImage.notification, height: 25, width: 19),
          SizedBox(width: 20),
          Image.asset(AppImage.scanner, height: 25, width: 19),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomBoxes.showSettingBox(
                onTap: () {
                  NavigationHelper.AnimatedNavigation(
                    context: context,
                    page: WalletScreens(),
                  );
                },
                text: 'Wallets',
                image: AppImage.wallet,
              ),
              CustomBoxes.showSettingBox(
                onTap: () {
                  NavigationHelper.AnimatedNavigation(
                    context: context,
                    page: SupportScreens(),
                  );

                },
                text: 'Support Center',
                image: AppImage.chat,
              ),
              CustomBoxes.showSettingBox(
                onTap: () {
                  NavigationHelper.AnimatedNavigation(
                    context: context,
                    page: TermsandconditionScreens(),
                  );

                },
                text: 'Terms & Conditions',
                image: AppImage.terms,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('We are in'),
                            Spacer(),
                            ...List.generate(
                              imageList.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  NavigationHelper.AnimatedNavigation(
                                    context: context,
                                    page: imageScreens.values.elementAt(index),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Image.asset(
                                    imageList[index],
                                    height: 34,

                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
