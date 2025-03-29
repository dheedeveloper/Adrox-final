import 'package:adrox/core/constants/text_styles.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_History.dart';
import 'package:adrox/core/utility/Custom_ShowDailogue.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovetodexScreens extends StatefulWidget {
  const MovetodexScreens({super.key});

  @override
  State<MovetodexScreens> createState() => _MovetodexScreensState();
}

class _MovetodexScreensState extends State<MovetodexScreens> {
  String selectedCoin = "USDT";
  String selectedImage = AppImage.Usdt;

  List<String> coins = ["USDT", "ADX"];
  List<String> images = [AppImage.Usdt, AppImage.Adx];

  bool isFocused = false;
  Future<void> Show() async {
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
      appBar: AppBar(centerTitle: true, title: Text('Move to DeX')),
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
                    SizedBox(height: 20),
                    CustomBoxes.button(

                        onTap: () {}, text: 'Move Now'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomHistory.buildTransactionTile(
                day: 'Today',
                filterTitle: 'Last Month',
                historyTitle: 'History',
                title: '150 USDT',
                subtitle: '3000ADX to 150USDT',
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
