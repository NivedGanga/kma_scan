import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage("assets/qr_top.png"),
              width: 393.w,
            ),
            Image(
              image: AssetImage("assets/qr_bottom.png"),
              width: 393.w,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.arrow_back),
                Text(
                  "Scan QR Code",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(83, 83, 83, 1),
                  ),
                ),
                Image(image: AssetImage("assets/qr_icon.png"))
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300.w),
              child: Text(
                "Scan the QR code to check-in",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(83, 83, 83, 1),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
