import 'package:adrox/core/constants/text_styles.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_History.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapusdtScreend extends StatefulWidget {
  const SwapusdtScreend({super.key});

  @override
  State<SwapusdtScreend> createState() => _SwapusdtScreendState();
}

class _SwapusdtScreendState extends State<SwapusdtScreend> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Swap ADX to USDT')),
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
                      image: AppImage.Usdt,
                      coin: 'ADX',
                      balance: '4099',
                      hintText: 'Enter Volume',
                    ),
                    SizedBox(height: 20),
                    CustomBoxes.showSwapBox(
                      onTap: () {},
                      image: AppImage.Adx,
                      hintText: 'Enter Volume',
                      coin: 'Get USDT',
                    ),
                    SizedBox(height: 20),
                    CustomBoxes.button(
                        size: 350, onTap: () {}, text: 'Swap Now'),
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
