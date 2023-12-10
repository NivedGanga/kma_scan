import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(
            image: AssetImage(
              "assets/qr_top.png",
            ),
          ),
          Spacer(),
          Text(
            "Registration status",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(83, 83, 83, 1),
            ),
          ),
          SizedBox(
            height: 55.h,
          ),
          Container(
            width: 222.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: kprimaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(25.sp),
              child: Column(
                children: [
                  Text(
                    "Total Check in",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  kHeight10,
                  Text(
                    "100/1000",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "100",
                    style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 55.h,
          ),
          Container(
            width: 222.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: kprimaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(25.sp),
              child: Column(
                children: [
                  Text(
                    "Total Food Coupen",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  kHeight10,
                  Text(
                    "100/1000",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "100",
                    style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image(
            image: AssetImage(
              "assets/qr_bottom.png",
            ),
          ),
        ],
      ),
    );
  }
}
