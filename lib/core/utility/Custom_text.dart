import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/constants/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomText {
  static final CustomText _singleton = CustomText._internal();
  CustomText._internal();
  static CustomText get instance => _singleton;

  showAssetText({
    String? image,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return ListTile(
      subtitle: Text(subtitle),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xff3ECD8B),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(price, style: TextStyle(color: Colors.white)),
      ),

      leading:
          (image != null && image.isNotEmpty)
              ? Image.asset(image, fit: BoxFit.cover, height: 38, width: 38)
              : null,
      title: Text(
        title,
        style: CustomTextStyles().fontWeight500White(fontSize: 15),
      ),
    );
  }

  showMyCoinsList({
    String? image,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return ListTile(
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(subtitle), Text(subtitle)],
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xff3ECD8B),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(price, style: TextStyle(color: Colors.white)),
      ),

      leading: Image.asset(
        image ?? '',
        fit: BoxFit.cover,
        height: 38,
        width: 38,
      ),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CustomTextStyles().fontWeight500White(fontSize: 15),
          ),
          Text(title),
        ],
      ),
    );
  }

  searchTextField({
    required TextEditingController controller,
    required FocusNode? focusNode,
    Color? borderColor,
    required String hintText,

    required ValueChanged<String>? onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 23.sp),
      child: Container(
        height: 56.sp,
        width: 0.89.sw,
        decoration: BoxDecoration(
          color: AppColors.searchcontainor,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 0.74.sw,
              child: TextFormField(
                onChanged: onChanged,
                focusNode: focusNode,
                style: CustomTextStyles().fontWeight500White(fontSize: 17.sp),
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5.sp, left: 30),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: CustomTextStyles().fontWeight400White(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showToastFailure(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.redAccent.shade200,
      textColor: Colors.white,
      fontSize: 18,
    );
  }

  showToastSuccess(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.green.shade600,
      textColor: Colors.white,
      fontSize: 18,
    );
  }
}
