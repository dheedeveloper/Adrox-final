import 'package:adrox/core/constants/App_colors.dart';
import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/Custom_text.dart';
import '../../creatAccount/view/verifyscreen.dart';
import '../controller/signincontroller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final walletAddress = TextEditingController();
  final mnemonicKey = TextEditingController();

  void verifyScreen() async {
    final signInController = Provider.of<SignInController>(context, listen: false);

    // await signInController.signIn(walletAddress.text, mnemonicKey.text);
    await signInController.signIn("0x500CB57fF6eb7EF34DBc694858a590B53d5E81C9",
    "loan acid egg term rude caution cost snow oblige gorilla card angle");

    if (signInController.signInData != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyScreen()));
      CustomText.instance.showToastSuccess(signInController.signInData!.message.toString());
    } else {
      CustomText.instance.showToastFailure("Something went wrong !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<SignInController>(
        builder: (context, value, child) =>value.isLoading?
        DataLoader():
        Scaffold(
          backgroundColor: Colors.white,
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
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                    elevation: 0.1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          spacing: 17,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringValues.loginTitle,
                              style: TextStyle(
                                fontFamily: "Roboto-medium",
                                fontWeight: FontWeight.w500,
                                fontSize: 25.sp,
                              ),
                            ),
                            Text(
                              StringValues.loginCont,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Roboto-regular",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Wallet Address",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto-regular",
                              ),
                            ),
                            TextField(
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "Roboto-medium",
                              ),
                              controller: walletAddress,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  hintText: "Enter Wallet Address",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: "Roboto-regular",
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffCCCCCC)),
                                      borderRadius: BorderRadius.circular(20.r))),
                            ),
                            Text(
                              "Mnemonic Key",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto-regular",
                              ),
                            ),
                            TextField(
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "Roboto-medium",
                              ),
                              controller: mnemonicKey,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 20),
                                  hintText: "Enter Mnemonic key",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontFamily: "Roboto-regular",
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(bottom: 40.h),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Paste',
                                          style: TextStyle(
                                            fontFamily: "Roboto-medium",
                                              color: AppColors.primarycolor),
                                        )),
                                  ),
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
                                      verifyScreen();
                                      // if(walletAddress.text.toString()==""||mnemonicKey.text.toString()==""){
                                      // CustomText.instance.showToastFailure("Please give details");
                                      // }else{
                                      //   verifyScreen();
                                      // }
                                    },
                                    text: "Sign In"),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     Navigator.pop(context);
                                //   },
                                //   style: ElevatedButton.styleFrom(
                                //     fixedSize: Size(100.w, 40.h),
                                //     backgroundColor: const Color(0xffF4F4F6),
                                //   ),
                                //   child: Text(
                                //     "Back",
                                //     style: TextStyle(
                                //       fontFamily: "Roboto-regular",
                                //       fontSize: 16.sp,
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                // ),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     verifyScreen();
                                //   },
                                //   style: ElevatedButton.styleFrom(
                                //     fixedSize: Size(150.w, 40.h),
                                //     backgroundColor: const Color(0xff3F5FF2),
                                //   ),
                                //   child: Text(
                                //     "Sign In",
                                //     style: TextStyle(
                                //       fontFamily: "Roboto-regular",
                                //       fontSize: 16.sp,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
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
