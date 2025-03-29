import 'package:adrox/core/constants/text_styles.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_History.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LendingpoolrequestScreens extends StatefulWidget {
  const LendingpoolrequestScreens({super.key});

  @override
  State<LendingpoolrequestScreens> createState() =>
      _LendingpoolrequestScreensState();
}

class _LendingpoolrequestScreensState extends State<LendingpoolrequestScreens> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Lending Pool Request')),
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

                    CustomBoxes.button(

                      onTap: () {},
                      text: 'Raise Lending Pool Request',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CustomHistory.buildTransactionTile(
                day: 'Today',
                filterTitle: 'Last Month',
                historyTitle: 'History',
                title: '${'150 USDT'}',
                status: "-Pending",
                subtitle: 'Capital Withdraw Request',
                time: '11.30Am',
                icon: Icons.access_time_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
