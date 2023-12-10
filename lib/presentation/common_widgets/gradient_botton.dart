import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGradientButton extends StatelessWidget {
  const MyGradientButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
      child: InkWell(
        radius: 8,
        onTap: onPressed,
        splashColor: Colors.blueAccent,
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 153, 186, 1),
                Color.fromRGBO(0, 209, 255, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0.sp,
            ),
          ),
        ),
      ),
    );
  }
}
