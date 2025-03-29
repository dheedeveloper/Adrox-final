import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Custom_text.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:adrox/screens/Login/creatAccount/view/backupphrase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/Custom_text.dart';
import '../controller/registercontroller.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final name = TextEditingController();
  final emailId = TextEditingController();
  final refferalId = TextEditingController();

  void backupPhrase() async {
    final registerController = Provider.of<RegisterController>(context, listen: false);
    await registerController.register(emailId.text,name.text.toString(),refferalId.text);
    if (registerController.registerData != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BackupPhrase()));
      CustomText.instance.showToastSuccess(registerController.registerData!.message.toString());
    } else {
      CustomText.instance.showToastFailure("Something went wrong !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<RegisterController>(
        builder: (context, value, child) => value.isLoading?
        DataLoader() :Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          body: Stack(
            children: [
              Positioned.fill(
                bottom: 260,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppImage.bluebg,
                  fit: BoxFit.cover,
                ),
              ),

              // Centered Logo
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    AppImage.logo,
                    color: Colors.white,
                    height: 85,
                    width: 290,
                  ),
                ),
              ),

              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                    elevation: 0.1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        spacing: 17,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Wallet",
                            style: TextStyle(
                                fontFamily: "Roboto-medium",
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            StringValues.walletCont,
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: "Roboto-regular",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto-regular",
                            ),
                          ),
                          TextField(
                            controller: name,
                            decoration: InputDecoration(
                                hintText: "Enter your Name",
                                hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Roboto-regular",
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 20.w),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r))),
                          ),
                          Text(
                            "Email Id",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto-regular",
                            ),
                          ),
                          TextField(
                            controller: emailId,
                            decoration: InputDecoration(
                                hintText: "Enter your Email Id",
                                hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Roboto-regular",
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 20.w),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r))),
                          ),
                          Text(
                            "Referral Id",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto-regular",
                            ),
                          ),
                          TextField(
                            controller: emailId,
                            decoration: InputDecoration(
                                hintText: "Enter Referral Id",
                                hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontFamily: "Roboto-regular",
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 20.w),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomBoxes.button(
                                textColor: Colors.black,
                                buttonColor: Color(0xffF4F4F6),
                                size: 93,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                text: "Back",
                              ),
                              CustomBoxes.button(
                                  size: 182,
                                  onTap: () {
                                    if(name.text.isEmpty||emailId.text.isEmpty||refferalId.text.isEmpty){
                                    CustomText.instance.showToastFailure("Please give details");
                                    }else{
                                      backupPhrase();
                                    }
                                  },
                                  text: "Next Step"),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
