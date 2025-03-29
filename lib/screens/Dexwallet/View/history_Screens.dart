import 'package:adrox/core/constants/text_styles.dart';
import 'package:adrox/core/utility/Custom_History.dart';

import 'package:adrox/core/utility/Custom_text.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';

class HistoryScreens extends StatefulWidget {
  const HistoryScreens({super.key});

  @override
  State<HistoryScreens> createState() => _HistoryScreensState();
}

class _HistoryScreensState extends State<HistoryScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('History')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHistory.showHistoryFull(
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
