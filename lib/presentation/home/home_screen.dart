import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/presentation/core/constants.dart';
import 'package:kma_reg/presentation/home/wisgets/home_botton.dart';
import 'package:kma_reg/presentation/qr_scan/qr_scan_screen.dart';
import 'package:kma_reg/presentation/status/status_screen.dart';

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
                "assets/qmark.png",
                height: 80.h,
                fit: BoxFit.fitWidth,
              ),
              kHeight10,
              Text(
                "Registration",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(83, 83, 83, 1),
                ),
              ),
              kHeight25,
              HomeButton(
                name: "Check-in",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrScanScreen(),
                      ));
                },
              ),
              kHeight15,
              HomeButton(
                name: "Check Status",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StatusScreen()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
