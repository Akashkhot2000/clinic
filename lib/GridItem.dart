import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GridItem extends StatelessWidget {
  final String svgPath;
  final String title;

  GridItem({required this.svgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          height: 60,
          width: 60,
        ),
        SizedBox(height: 0.5.h),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2, // Display up to 2 lines
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF130F26),
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0.13.h,
          ),
        ),
      ],
    );
  }
}
