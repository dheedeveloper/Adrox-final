import 'package:adrox/core/utility/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:adrox/core/utility/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
    List<String> imageUrls = ['assets/images/dummy.png'];
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
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
                      image: const DecorationImage(
                        image: AssetImage("assets/images/dummy.png"),
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
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(alignment: Alignment(5.h, 10.h),
                                  image: AssetImage(
                                    AppImage.whitePaper,
                                  ),
                                  ),
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(15.r)),
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
                                  Text("USDT",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Roboto-regular",
                                        fontSize: 16.sp,
                                      )),
                                  Text("2938",
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
                                    color: const Color(0xff3ECD8B),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Center(
                                  child: Text("+ 0.02%",
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
