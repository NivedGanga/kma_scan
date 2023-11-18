import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';
import 'package:kma_reg/presentation/home/wisgets/home_botton.dart';
import 'package:kma_reg/presentation/qr_scan/qr_scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/home_top.png",
                width: 393.w,
                fit: BoxFit.fitWidth,
              ),
              Image.asset(
                "assets/home_bottom.png",
                width: 393.w,
                fit: BoxFit.fitWidth,
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/kma_logo.png",
                width: 154.w,
              ),
              kHeight15,
              Text(
                "Event Registration",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(83, 83, 83, 1),
                ),
              ),
              kHeight15,
              HomeButton(
                name: "Check-in",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QrScanScreen()));
                },
              ),
              kHeight15,
              HomeButton(
                name: "Food Coupon",
                onPressed: () {},
              ),
              kHeight15,
              HomeButton(
                name: "Check Status",
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
