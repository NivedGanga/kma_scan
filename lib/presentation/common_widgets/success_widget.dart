import 'dart:math';

import 'package:checkmark/checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({super.key, required this.checkedInModel});
  final CheckedInModel checkedInModel;
  @override
  State<SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  ValueNotifier<bool> checked = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checked.value = true;
    });
    return Column(
      children: [
        kHeight30,
        Text(
          "Successful",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 55.h,
        ),
        ValueListenableBuilder(
            valueListenable: checked,
            builder: (context, isChecked, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedScale(
                    scale: isChecked ? 2.3 : 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Image(
                      height: 70.w,
                      width: 70.w,
                      image: AssetImage("assets/celeb1.png"),
                    ),
                  ),
                  AnimatedScale(
                    scale: isChecked ? 2.1 : 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    child: Image(
                      height: 70.w,
                      width: 70.w,
                      image: AssetImage("assets/celeb2.png"),
                    ),
                  ),
                  Container(
                    height: 90.w,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Transform.rotate(
                        angle: -pi / 19,
                        child: CheckMark(
                          strokeWidth: 8,
                          activeColor: const Color.fromARGB(255, 255, 255, 255),
                          active: isChecked,
                          curve: Curves.easeInOutCirc,
                          duration: const Duration(milliseconds: 1000),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
        SizedBox(
          height: 65.h,
        ),
        Container(
          width: 287.w,
          decoration: BoxDecoration(
            color: Color.fromRGBO(232, 254, 255, 1),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "QR details",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                kHeight5,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name : ",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.checkedInModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email : ",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.checkedInModel.email,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction ID :",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.checkedInModel.transactionId,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
