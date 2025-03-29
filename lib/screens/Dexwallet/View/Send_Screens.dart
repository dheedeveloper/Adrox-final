import 'package:adrox/core/constants/text_styles.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_History.dart';
import 'package:adrox/core/utility/Custom_ShowDailogue.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendScreens extends StatefulWidget {
  const SendScreens({super.key});

  @override
  State<SendScreens> createState() => _SendScreensState();
}

class _SendScreensState extends State<SendScreens> {
  String selectedCoin = "USDT";
  String selectedImage = AppImage.Usdt;

  List<String> coins = ["USDT", "ADX"];
  List<String> images = [AppImage.Usdt, AppImage.Adx];

  bool isFocused = false;
  Future<void>Show () async {
    CustomShowdailogue.showDropdownDialog(
      context: context,
      coins: coins,
      images: images,
      onSelected: (coin, image) {
        setState(() {
          selectedCoin = coin;
          selectedImage = image;
          isFocused = false;
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Send')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBoxes.showRoundBox(
                      onTap: () {
                        Show();
                        setState(() {
                          isFocused = true;
                        });
                      },
                      onFocusChange: (focus) {
                        setState(() {
                          isFocused = focus;
                        });
                      },
                      isFocused: isFocused,
                      dropDown: AppImage.dropDown,
                      image: selectedImage,
                      coin: selectedCoin,
                      balance: '4099',
                      hintText: 'Enter Volume',
                    ),
                    SizedBox(height: 30),

                    CustomBoxes.showSwapBox2(
                      hintText: 'Enter Wallet Address',
                      coinName: 'SOL Only',
                    ),
                    SizedBox(height: 30),
                    CustomBoxes.button(onTap: () {}, text: ' Send USDT'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CustomHistory.buildTransactionTile(
                day: 'Today',
                filterTitle: 'Last Month',
                historyTitle: 'Recents',
                title: '150 USDT',
                subtitle: 'Hash 0X98DFTHG88944ERTG6',
                time: '11.30Am',
                icon: Icons.swap_horiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
