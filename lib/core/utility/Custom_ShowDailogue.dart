import 'package:flutter/material.dart';

class  CustomShowdailogue  {
  static void showDropdownDialog({
    required BuildContext context,
    required List<String> coins,
    required List<String> images,
    required Function(String, String) onSelected,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Coin"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: coins.asMap().entries.map((entry) {
              int index = entry.key;
              String coin = entry.value;
              return ListTile(
                leading: Image.asset(
                  images[index],
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                title: Text(coin),
                onTap: () {
                  onSelected(coin, images[index]); // Callback function
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
