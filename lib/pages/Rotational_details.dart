import 'package:clinic/GridItem.dart';
import 'package:flutter/material.dart';
import 'package:clinic/Common_Widget/common_app_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Rotational_details extends StatefulWidget {
  const Rotational_details({super.key});

  @override
  State<Rotational_details> createState() => _Rotational_detailsState();
}

class ImageData {
  final String svgPath;
  final String title;

  ImageData({required this.svgPath, required this.title});
}

class common {
  String? icon_commonappbar;
  String? title_commonappbar;

  common({this.icon_commonappbar, this.title_commonappbar});
}

class _Rotational_detailsState extends State<Rotational_details>
    with SingleTickerProviderStateMixin {
  final List<String>? student = [
    'Akash',
    'Ankita',
    'Anita',
    'Suraj',
  ];
  List<String> filteredStudent = [];
  late TabController _tabController;
  int _currentTabIndex = 0;
  String? _selectedState;
  bool _showSearchBar = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    filteredStudent = List.from(student!); // Initialize filtered list
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      _currentTabIndex = _tabController.index;
      _showSearchBar = _currentTabIndex == 1;
    });
  }

  void filterList(String query) {
    setState(() {
      filteredStudent = student!
          .where(
              (student) => student.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  final List<ImageData> imageData = [
    ImageData(svgPath: 'assets/icons/image1.svg', title: 'Attendance'),
    ImageData(svgPath: 'assets/icons/image2.svg', title: 'Checkoffs'),
    ImageData(svgPath: 'assets/icons/image3.svg', title: 'Dr.Interaction'),
    ImageData(svgPath: 'assets/icons/image4.svg', title: 'Daily Journal'),
    ImageData(svgPath: 'assets/icons/image5.svg', title: 'Formative'),
    ImageData(svgPath: 'assets/icons/image6.svg', title: 'Incident'),
    ImageData(svgPath: 'assets/icons/image7.svg', title: 'Daily/Weekly'),
    ImageData(svgPath: 'assets/icons/image8.svg', title: 'Midterm'),
    ImageData(svgPath: 'assets/icons/image9.svg', title: 'Summative'),
    ImageData(
        svgPath: 'assets/icons/image10.svg', title: 'Volunteer Evaluation'),
    ImageData(svgPath: 'assets/icons/image11.svg', title: 'Exception'),
    ImageData(
        svgPath: 'assets/icons/image12.svg',
        title: 'Floor Therapy And ICU Evaluation'),
    ImageData(svgPath: 'assets/icons/image13.svg', title: 'PEF Evaluation'),
    ImageData(svgPath: 'assets/icons/image14.svg', title: 'Equipment List'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: common_app_bar(
          currentindex: _currentTabIndex,
          icon_commonappbar: 'assets/icons/a.svg',
          title_commonappbar: 'Rotation Details',
          showSearchBar: _showSearchBar,
          onSearchChanged: filterList,
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 2.w, right: 2.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: Stack(children: [
                              Container(
                                width: 10.5.w,
                                height: 7.5.h,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEAF3FF),
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
                                        color: Color(0xFF509CFF),
                                        fontSize: 18.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 0.w, top: 0.h),
                                      child: Text(
                                        'Sep',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF509CFF),
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Test Rotation ',
                                  style: TextStyle(
                                    color: Color(0xFF1A203D),
                                    fontSize: 16.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Hospital site :',
                                        style: TextStyle(
                                          color: Color(0x871A203D),
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Bon Temps Medical',
                                        style: TextStyle(
                                          color: Color(0xFF1A203D),
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Course : ',
                                        style: TextStyle(
                                          color: Color(0xFF868998),
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'XYZ Course',
                                        style: TextStyle(
                                          color: Color(0xFF1A203D),
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 390.w,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.5,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFE7E7E7),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelStyle:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                tabs: [Tab(text: 'Functions'), Tab(text: 'Students')],
                // onTap: (index) {
                //   setState(() {
                //     _currentTabIndex = index;
                //     _showSearchBar = index == 1;
                //   });
                // },
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Tab 1: Functions
                    Padding(
                      padding: EdgeInsets.all(1.0.h),
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 0.8,
                                // mainAxisExtent: 12,

                                childAspectRatio:
                                    MediaQuery.of(context).size.width / 3 / 120,
                              ), // Adjust as needed
                              itemCount: imageData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GridItem(
                                  svgPath: imageData[index].svgPath,
                                  title: imageData[index].title,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    // Tab 2: Students
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: filteredStudent.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    height: 2.h,
                                    child: Text(filteredStudent[index])),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
