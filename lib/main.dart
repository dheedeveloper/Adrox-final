import 'package:adrox/screens/Landing/homemenu/controller/homescreencontroller.dart';
import 'package:adrox/screens/Landing/lendingMenu/controller/confirmlendingcontroller.dart';
import 'package:adrox/screens/Landing/lendingMenu/controller/lendingcontroller.dart';
import 'package:adrox/screens/Landing/lendingMenu/controller/lendinghistorycontroller.dart';
import 'package:adrox/screens/Landing/profitMenu/controller/profitcontroller.dart';
import 'package:adrox/screens/Login/creatAccount/controller/confirmregistercontroller.dart';
import 'package:adrox/screens/Login/creatAccount/controller/registercontroller.dart';
import 'package:adrox/screens/Login/creatAccount/controller/verificationcontroller.dart';
import 'package:adrox/screens/Login/signIn/controller/signincontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'screens/Login/signIn/view/splashscreen.dart';
import 'screens/Tabs_Screens/AppAndDex_Tabvies.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInController()),
        ChangeNotifierProvider(create: (_) => RegisterController()),
        ChangeNotifierProvider(create: (_) => ConfirmRegisterController()),
        ChangeNotifierProvider(create: (_) => VerifyController()),
        ChangeNotifierProvider(create: (_) => HomeScreenController()),
        ChangeNotifierProvider(create: (_) => LendingController()),
        ChangeNotifierProvider(create: (_) => LendingHistoryController()),
        ChangeNotifierProvider(create: (_) => ProfitController()),
        ChangeNotifierProvider(create: (_) => ConfirmLendingController()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
