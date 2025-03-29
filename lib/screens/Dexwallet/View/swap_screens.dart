import 'package:adrox/core/constants/text_styles.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_ShowDailogue.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapScreens extends StatefulWidget {
  const SwapScreens({super.key});

  @override
  State<SwapScreens> createState() => _SwapScreensState();
}

class _SwapScreensState extends State<SwapScreens> {
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
      appBar: AppBar(centerTitle: true, title: Text('Swap Coin')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You Pay',
                      style: CustomTextStyles().fontWeight400White(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 10),
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
                    Text(
                      'You Get',
                      style: CustomTextStyles().fontWeight400White(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomBoxes.showSwapBox(
                      onTap: () {},
                      dropDown: AppImage.dropDown,
                      image: AppImage.Adx,
                      hintText: 'Enter Volume',
                      coin: selectedCoin,
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Swapped Coin Receiving Address',
                      style: CustomTextStyles().fontWeight400White(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomBoxes.showSwapBox2(
                      hintText: 'Enter Wallet Address',
                      coinName: 'SOL Only',
                    ),
                    SizedBox(height: 30),
                    CustomBoxes.button(onTap: () {}, text: 'Swap Now'),
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
