import 'package:adrox/core/constants/apiservice.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/core/utility/localstorage.dart';
import 'package:adrox/screens/Landing/homemenu/controller/homescreencontroller.dart';
import 'package:adrox/screens/Landing/lendingMenu/view/lendingscreen.dart';
import 'package:adrox/screens/Landing/profitMenu/profitscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:adrox/core/utility/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List titles = [
    "Whitepaper",
    "Project",
    "Roadmap",
    "Ai Robotics",
    "E-commerce",
    "Games",
    "Education",
    "Support",
  ];

  List imgs =[
    AppImage.whitePaper,AppImage.project,AppImage.roadMap,AppImage.aiRobo,AppImage.ecommerce,AppImage.games,
    AppImage.education,AppImage.support,
  ];

  List<String> imageUrls = ['assets/images/dummy.png'];

  void apiCall() async {
    final homeController = Provider.of<HomeScreenController>(context, listen: false);
      await homeController.homeApiCall(DynamicStrings().token);
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<HomeScreenController>(
          builder: (context, value, child) =>value.isLoading||value.homeData==null ?DataLoader(): Scaffold(
                body:_selectedIndex==0? SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImage.logo,
                      height: 33,
                      width: 105,
                    ),
                    const Spacer(),
                    Image.asset(
                      AppImage.setting,
                      height: 19,
                      width: 19,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Image.asset(AppImage.notification, height: 19, width: 19),
                    SizedBox(
                      width: 25.w,
                    ),
                    InkWell(
                        onTap: () {},
                        child:
                            Image.asset(AppImage.scanner, height: 19, width: 19)),
                  ],
                ),
                SizedBox(
                  height: 20.w,
                ),
                Container(
                  height: 70.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15.r,
                      ),
                      color: const Color(0xffF4F4F6)),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImage.announcement,
                        height: 50.h,
                        width: 62.h,
                      ),
                      SizedBox(width: 10.w),
                      Text(StringValues.home,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-medium",
                            fontSize: 12.sp,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // CarouselSlider(
                //   items: [
                //     Container(
                //       height: 130.h,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20.r),
                //         image: const DecorationImage(
                //           image: AssetImage("assets/images/dummy.png"),
                //           fit: BoxFit.contain,
                //         ),
                //       ),
                //     ),
                //   ], // Ensure it's a List, not a Set
                //   options: CarouselOptions(
                //     autoPlay: false,
                //     viewportFraction: 1.0,
                //     height: 150,
                //     autoPlayCurve: Curves.fastOutSlowIn,
                //     enableInfiniteScroll: false,
                //   ),
                // ),

                CarouselSlider(
                  items: [
                    Container(
                      height: 130.h,
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          image:NetworkImage(value.homeData!.data!.banner![0].img.toString()),
                          // image: AssetImage("assets/images/dummy.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: false,
                    viewportFraction: 0.8,
                    height: 150,
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text("Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto-medium",
                      fontSize: 16.sp,
                    )),
                SizedBox(
                  height: 230.h,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 2 columns
                      crossAxisSpacing: 10.w, // Spacing between columns
                      mainAxisSpacing: 10.h, // Spacing between rows
                      childAspectRatio:
                          150.w / 230.h, // Aspect ratio for proper size
                    ),
                    itemCount: 8, // 2 columns × 3 rows = 6 items
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.h),
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: ClipRRect(
                              child: Image.asset(
                                imgs[index],
                                height: 10.h, // Adjust height to make image smaller
                                width: 10.h, // Adjust width to make image smaller
                                fit: BoxFit.contain, // Ensures image fits inside the container
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(titles[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto-regular",
                                fontSize: 11.sp,
                              )),
                        ],
                      );
                    },
                  ),
                ),
                Text("Coins",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto-medium",
                      fontSize: 16.sp,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                    height: 350.h,
                    child: ListView.builder(
                        itemExtent: 50.h,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  // value.homeData!.data!.coinList![index].image.toString(),
                                  AppImage.Usdt,
                                  height: 30.h,
                                  width: 30.w,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value.homeData!.data!.coinList![index].symbol.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Roboto-regular",
                                          fontSize: 16.sp,
                                        )),
                                    Text(value.homeData!.data!.coinList![index].price.toString(),
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: "Roboto-medium",
                                          fontSize: 12.sp,
                                        )),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 25.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      color:value.homeData!.data!.coinList![index].changeValue==true? Color(0xff3ECD8B):Color(0xffE46364),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Center(
                                    child: Text("${value.homeData!.data!.coinList![index].change1H.toString()} %",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Roboto-regular",
                                          fontSize: 13.sp,
                                        )),
                                  ),
                                )
                              ],
                            )))
              ],
            ),
          ),
                ):
                    _selectedIndex==1?LendingScreen():ProfitHomeTab(),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                unselectedLabelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto-medium",
                    fontSize: 12.sp),
                selectedLabelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto-medium",
                    fontSize: 12.sp),
                selectedItemColor: Colors.blue, // Active tab color
                unselectedItemColor: Colors.black54,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                        height: 21,
                        width: 21,
                        _selectedIndex == 0
                            ? AppImage.homeSelect
                            : AppImage.homeDis),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                        height: 21,
                        width: 21,
                        _selectedIndex == 1
                            ? AppImage.lendingSelect
                            : AppImage.lendingDis),
                    label: 'Lending',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                        height: 21,
                        width: 21,
                        _selectedIndex == 2
                            ? AppImage.profitSelect
                            : AppImage.profitDis),
                    label: 'Profit',
                  ),
                ]),
              ),
        ));
  }
}

class T_RoundImage extends StatelessWidget {
  const T_RoundImage({
    super.key,
    required this.Imgurl,
    this.height = 130,
    this.applyImageradius = true,
    this.border,
    this.backgroundcolor,
    this.fit = BoxFit.cover, // Use BoxFit.cover for better fitting images
    this.padding,
    this.isNetWorkingImage = false,
    this.onPressed,
    this.borderradius = 20, // Adjusted to a larger, medium-sized radius
  });

  final String Imgurl;
  final double? height;
  final bool applyImageradius;
  final BoxBorder? border;
  final Color? backgroundcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final double borderradius;
  final bool isNetWorkingImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border ??
              Border.all(color: Colors.grey.shade300), // Adds a subtle border
          color: backgroundcolor ?? Colors.white, // Default background color
          borderRadius: applyImageradius
              ? BorderRadius.circular(borderradius)
              : BorderRadius.zero,
        ),
        child: ClipRRect(
          borderRadius: applyImageradius
              ? BorderRadius.circular(borderradius)
              : BorderRadius.zero,
          child: Image(
            image: isNetWorkingImage
                ? NetworkImage(Imgurl)
                : AssetImage(Imgurl) as ImageProvider,
            fit: fit, // Fit set for better appearance
          ),
        ),
      ),
    );
  }
}
