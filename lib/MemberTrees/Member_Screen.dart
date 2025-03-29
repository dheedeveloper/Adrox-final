import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Member Tree',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffDCDCE5).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kumar",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("IJ5566"),
                                SizedBox(height: 20),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "Lending  ",
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(
                                                0.5)), // Label style
                                      ),
                                      TextSpan(
                                        text: "5000USDT",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "Team's  ",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      TextSpan(
                                        text: "80,000USDT",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "D.O.J  ",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      TextSpan(
                                        text: "20 Apr 2025",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 20,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(20),
                              dashPattern: [6, 3],
                              color: Color(0xffDCDCE5),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Left",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Right",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("30",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text("30",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 1,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 25,
                                  width: 1,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xffEFFAF8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Abi",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("IJ5689"),
                                  SizedBox(height: 20),
                                  Center(
                                    child: DottedBorder(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      dashPattern: [6, 3],
                                      color: Color(0xffDCDCE5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text("Left"),
                                                Text("30",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              children: [
                                                Text("Right"),
                                                Text("30",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text("Lending: 5000USDT"),
                                  SizedBox(height: 10),
                                  Text("Team's: 80,000USDT"),
                                  SizedBox(height: 10),
                                  Text("D.O.J 20 Apr 2025"),
                                  SizedBox(height: 10),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text("View more >"))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 1,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 25,
                                  width: 1,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xffEFFAF8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Naagu",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("KI5689"),
                                  SizedBox(height: 20),
                                  Center(
                                    child: DottedBorder(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(20),
                                      dashPattern: [6, 3],
                                      color: Color(0xffDCDCE5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text("Left"),
                                                Text("123",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              children: [
                                                Text("Right"),
                                                Text("265",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text("Lending: 5000USDT"),
                                  SizedBox(height: 10),
                                  Text("Team's: 80,000USDT"),
                                  SizedBox(height: 10),
                                  Text("D.O.J 20 Apr 2025"),
                                  SizedBox(height: 10),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text("View more >"))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
