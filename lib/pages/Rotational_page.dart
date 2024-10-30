import 'package:clinic/pages/Rotational_details.dart';
import 'package:clinic/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Rotational_page extends StatefulWidget {
  const Rotational_page({super.key});

  @override
  State<Rotational_page> createState() => _Rotational_pageState();
}

class _Rotational_pageState extends State<Rotational_page> {
  final List<Color> itemColors = [
    Color(0xFF7BB4FF),
    Color(0xFFECE2FD),
    Color(0xFFFFF3DA),
    Color(0xFFF6DADA),
  ];

  final List<String> svgAssets = [
    'assets/icons/Active_rotation.svg',
    'assets/icons/Active_student.svg',
    'assets/icons/current_courses.svg',
    'assets/icons/absent_student.svg',
  ];

  final List<String> Rotation_names = [
    'Active Rotation',
    'Active Students',
    'Current Courses',
    'Absents Students',
  ];

  final List<String> Total_students = ['186', '42', '12', '67'];
  final List<String> Students = ['/1223', '/1223', '', ''];

  bool showSecondContainer = false;
  Widget Clock_out_Container() {
    return Container(
      width: 90.w,
      height: 13.h,
      decoration: ShapeDecoration(
        color: Color(0x1E57BF9C),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF01A750)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 3.w,
          right: 3.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            // width: 60.w,
            // height: 10.h,
            // child:
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.h, top: 1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Phillip Bergson Hospital',
                      style: TextStyle(
                          color: Color(0xFF1A203D),
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Clock in time :',
                                style: TextStyle(
                                    color: Color(0x871A203D),
                                    fontSize: 14.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              TextSpan(
                                text: ' 8:30 am',
                                style: TextStyle(
                                  color: Color(0xFF1A203D),
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: SvgPicture.asset('assets/icons/Location.svg'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Clock out time : ',
                            style: TextStyle(
                              color: Color(0xFF868998),
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.12.h,
                            ),
                          ),
                          TextSpan(
                            text: '-',
                            style: TextStyle(
                              color: Color(0xFF1A203D),
                              fontSize: 14.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.10.h,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ),
            Container(
              width: 16.w,
              height: 9.5.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                      child: Text(
                        'Clock out',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1A203D),
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showSecondContainer = false;
                        });
                      },
                      child: Container(
                          height: 5.5.h,
                          width: 25.w,
                          child: SvgPicture.asset('assets/icons/clock.svg')),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(
            color: Color(0xFF1A203D),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          showSecondContainer
              ? Clock_out_Container()
              : Container(
                  width: 90.w,
                  height: 13.h,
                  decoration: ShapeDecoration(
                    color: Color(0x1E57BF9C),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF01A750)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 40,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '22',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF063835),
                                  fontSize: 18.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Sep',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF063835),
                                  fontSize: 15.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        // Container(
                        // color: Colors.amber,
                        // width: 60.w,
                        // height: 10.h,
                        // child:
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 2.h, bottom: 1.h, left: 2.w, right: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Clock in / Clockout',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: 0.8.h,
                                ),
                                Text(
                                  'Please go the the hospital site to \nclockin and clockout once you leave',
                                  style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 14.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showSecondContainer = true;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/next.svg',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          // :

          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.5,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 24,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFE6E6E6)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.h),
                                    child: Text(
                                      'All time',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0.20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1.5.h,
                                    child: SvgPicture.asset(
                                        'assets/icons/arrow-down.svg'),
                                  ),
                                ],
                              )
                            ]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 400, // Set the height as needed
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.w,
                        childAspectRatio:
                            MediaQuery.of(context).size.width / 2 / 120,
                        mainAxisSpacing: 5.w),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                          width: 167,
                          height: 107,
                          decoration: ShapeDecoration(
                            color: itemColors[index].withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(19.39),
                                bottomRight: Radius.circular(19.30),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 2.h, bottom: 2.h, left: 4.w, right: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(svgAssets[index]),
                                    // SvgPicture.asset(
                                    //     'assets/icons/absent_student.svg'),
                                    Padding(
                                        padding: EdgeInsets.only(right: 1.w),
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: Total_students[index],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                              TextSpan(
                                                text: Students[index],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.right,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  Rotation_names[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.12,
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Rotational_details()),
                    );
                  },
                  child: Container(
                      color: Colors.amber,
                      child: Text('Rotaional_details_page'))),
              SizedBox(
                height: 3.h,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child:
                      Container(color: Colors.amber, child: Text('profile'))),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => splash_screen()),
              //       );
              //     },
              //     child: Container(child: Text('splash screen')))
            ]),
          ),
        ],
      ),
    );
  }
}
