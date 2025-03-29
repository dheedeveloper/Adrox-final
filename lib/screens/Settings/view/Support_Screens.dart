import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:adrox/core/utility/Custom_Boxes.dart';
import 'package:adrox/core/utility/Navigation_Helper.dart';
import 'package:adrox/core/utility/images.dart';
import 'package:adrox/screens/Settings/view/Chat_Screens.dart';
import 'package:adrox/screens/Settings/view/RaiseTickets_Screens.dart';
import 'package:flutter/material.dart';

class SupportScreens extends StatefulWidget {
  const SupportScreens({super.key});

  @override
  State<SupportScreens> createState() => _SupportScreensState();
}

class _SupportScreensState extends State<SupportScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Support', usePaddedLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationHelper.AnimatedNavigation(
                            context: context, page: ChatScreens());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            top: 15,
                            bottom: 15,
                            left: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 75,
                                width: 74,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0XFF619FFC).withOpacity(0.1),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      height: 25,
                                      fit: BoxFit.cover,
                                      AppImage.opened,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Opened',
                                      maxLines: 2,
                                      overflow: TextOverflow
                                          .ellipsis, // Show ellipsis
                                      style: TextStyle(
                                        color: Color(0XFF619FFC),
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Transaction Failed due to some reason, i don’t ...' ??
                                          "No Subject",
                                      style: const TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Created on 27.03.25",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            top: 15,
                            bottom: 15,
                            left: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 75,
                                width: 74,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff3ECD8B).withOpacity(0.1),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      height: 25,
                                      fit: BoxFit.cover,
                                      AppImage.solved,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Solved',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0XFFFF8A58),
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Transaction Failed due to some reason, i don’t ...' ??
                                          "No Subject",
                                      style: const TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Created on 27.03.25",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            top: 15,
                            bottom: 15,
                            left: 15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 75,
                                width: 74,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff3F5FF2).withOpacity(0.1),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      height: 25,
                                      fit: BoxFit.cover,
                                      AppImage.pending,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Pending',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xff3F5FF2),
                                        fontSize: 9,
                                        // color: ticket.status == "Open"
                                        //     ? const Color(0XFF619FFC)
                                        //     : (ticket.status ==
                                        //     "Pending"
                                        //     ? const Color(
                                        //     0XFFFF8A58)
                                        //     : const Color(
                                        //     0XFF39C468)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Transaction Failed due to some reason, i don’t ...' ??
                                          "No Subject",
                                      style: const TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Created on 27.03.25",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomBoxes.button(
                      size: 350,
                      onTap: () {
                        NavigationHelper.AnimatedNavigation(
                          context: context,
                          page: RaiseticketsScreens(),
                        );
                      },
                      text: 'Raise Tickets',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
