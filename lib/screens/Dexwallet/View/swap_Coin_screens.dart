import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/constants/text_styles.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_text.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapCoinScreens extends StatefulWidget {
  const SwapCoinScreens({super.key});

  @override
  State<SwapCoinScreens> createState() => _SwapCoinScreensState();
}

class _SwapCoinScreensState extends State<SwapCoinScreens> {
  TextEditingController search = TextEditingController();
  FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Swap Coin List')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CustomText.instance.searchTextField(
                      controller: search,
                      focusNode: searchFocus,
                      hintText: "Search Coin",
                      onChanged: (val) {},
                    ),
                    SizedBox(height: 20),
                    CustomText.instance.showAssetText(
                      title: 'ETH',
                      subtitle: '\$25555',
                      price: '+0.230',
                    ),
                    CustomText.instance.showAssetText(
                      title: 'USDT',
                      subtitle: '\$25555',
                      price: '+0.249',
                    ),
                    CustomText.instance.showAssetText(
                      title: 'POL',
                      subtitle: '\$25555',
                      price: '+0.249',
                    ),
                    CustomText.instance.showAssetText(
                      title: 'SOL',
                      subtitle: '\$25555',
                      price: '+0.249',
                    ),
                    CustomText.instance.showAssetText(
                      title: 'BNB',
                      subtitle: '\$25555',
                      price: '+0.249',
                    ),
                    CustomText.instance.showAssetText(
                      title: 'ADX',
                      subtitle: '\$25555',
                      price: '+0.249',
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
