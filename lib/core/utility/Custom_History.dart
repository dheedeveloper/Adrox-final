import 'package:flutter/material.dart';

import 'images.dart';

class CustomHistory {
  static final CustomHistory _singleton = CustomHistory._internal();

  CustomHistory._internal();

  static CustomHistory get instance => _singleton;
  static buildTransactionTile({
    required String title,
    required String historyTitle,
    required String day,
    required String filterTitle,
    required String subtitle,
    required String time,
    String? status,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(historyTitle, style: TextStyle(fontSize: 18)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xffCCCCCC)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Row(
                      children: [
                        Text(filterTitle),
                        SizedBox(width: 5),
                        Image.asset(
                          AppImage.dropDown,
                          height: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(day),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Container(
              height: 50,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: Colors.blue),
            ),
            title: Row(
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                if (status != null)
                  Text(status, style: TextStyle(color: Colors.blue)),
              ],
            ),
            subtitle: Text(subtitle),
            trailing: Text(time),
          ),
        ],
      ),
    );
  }

  static showHistoryFull({
    required String title,

    required String day,

    required String subtitle,
    required String time,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(day),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Container(
              height: 50,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: Colors.blue),
            ),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle),
            trailing: Text(time),
          ),
        ],
      ),
    );
  }
}
