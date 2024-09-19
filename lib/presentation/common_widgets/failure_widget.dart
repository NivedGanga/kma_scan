import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/presentation/core/constants.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight30,
        Text(
          "Failed",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Image(
          height: 95.w,
          width: 95.w,
          image: AssetImage("assets/fail.png"),
        ),
        kHeight20,
        Text(
          errorMessage,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
