import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? label;

  const CustomTextField(
      {Key? key, required this.controller, this.hintText, this.label})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.5.h),
      child: Container(
        width: 90.w,
        height: 14.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0.8.h),
              child: Text(
                widget.label!,
                style: TextStyle(
                  color: Color(0xFF5F6377),
                  fontSize: 15.5.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                color: Color(0xFFF6F9F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(0.8.h),
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                      hintText: widget.hintText!,
                      hintStyle: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 15.5.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
