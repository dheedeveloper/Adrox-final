import 'package:adrox/core/constants/text_styles.dart';

import 'package:adrox/core/utility/Custom_text.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:flutter/material.dart';

class MyCoinsScreens extends StatefulWidget {
  const MyCoinsScreens({super.key});

  @override
  State<MyCoinsScreens> createState() => _MyCoinsScreensState();
}

class _MyCoinsScreensState extends State<MyCoinsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('My Coin')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText.instance.showMyCoinsList(
                price: '+ 0.0023',
                subtitle: '\$2,365.16',
                image: AppImage.Adx,
                title: 'Adx',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
