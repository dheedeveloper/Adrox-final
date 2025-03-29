import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:adrox/screens/Login/creatAccount/controller/verificationcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/utility/Custom_text.dart';
import '../../../Landing/homemenu/homescreen.dart';
import '../../signIn/controller/signincontroller.dart';
import 'disablescreen.dart';


class VerifyScreen extends StatefulWidget {
  final wallet;
  final mnemonic;
  const VerifyScreen({super.key, this.wallet, this.mnemonic});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {


  final verifyController = TextEditingController();

  void verifyScreen() async {
    final signInController = Provider.of<SignInController>(context, listen: false);
    final verify2FAProvider = Provider.of<VerifyController>(context, listen: false);

    if(widget.wallet.toString().isEmpty &&widget.mnemonic.toString().isEmpty){
      await verify2FAProvider.verify2FA(DynamicStrings().secretCode,verifyController.text);

      if (verify2FAProvider.verifyData != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        CustomText.instance.showToastFailure("Something went wrong !");
      }
    }else{
      await signInController.signIn(widget.wallet??"",widget.mnemonic??"",verifyController.text);

      if (signInController.signInData != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        CustomText.instance.showToastSuccess(signInController.signInData!.message.toString());
      } else {
        CustomText.instance.showToastFailure("Something went wrong !");
      }
    }
  }

  void disableScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DisableScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<VerifyController>(builder: (context, value, child) =>value.isLoading?
      DataLoader() : Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 660.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white),
                          child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.keyboard_backspace_rounded)),
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        Text(
                          "Verify 2FA",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto-medium",
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 60.h),
                    child: Image.asset(AppImage.verify),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
                      width: double.infinity.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "2FA Verifcation",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: "Roboto-medium",
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          Text(
                            StringValues.verify2fa,
                            style: TextStyle(
                              color: Colors.black45,
                              fontFamily: "Roboto-regular",
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          TextField(
                            controller: verifyController,
                            decoration: InputDecoration(
                                suffixIcon: Image.asset(
                                  AppImage.copyImg,
                                  height: 5,

                                ),
                                hintText: "Enter 2fa code",
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontFamily: "Roboto-regular",
                                ),
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
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomBoxes.button(
                      onTap: () {
                        if(verifyController.text.isEmpty){
                          CustomText.instance.showToastFailure("Please give details");
                        }else{
                          verifyScreen();
                        }
                      },
                      text: "Next Step"),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
