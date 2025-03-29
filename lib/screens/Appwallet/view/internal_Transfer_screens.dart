import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_History.dart';
import 'package:adrox/core/utility/Custom_ShowDailogue.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternalTransferScreens extends StatefulWidget {
  const InternalTransferScreens({super.key});

  @override
  State<InternalTransferScreens> createState() =>
      _InternalTransferScreensState();
}

class _InternalTransferScreensState extends State<InternalTransferScreens> {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('P2P', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
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
                      onTap: () async {
                        await Show();
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
                      hintText: 'Enter USDT',
                    ),
                    SizedBox(height: 20),
                    CustomBoxes.showRoundBox2(
                      hintText: 'Enter Used Id',
                      idName: 'To User Id',
                    ),
                    SizedBox(height: 20),
                    CustomBoxes.button(onTap: () {}, text: 'Send USDT'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              CustomHistory.buildTransactionTile(
                historyTitle: 'History',
                filterTitle: 'Last Month',
                day: 'Today',
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
