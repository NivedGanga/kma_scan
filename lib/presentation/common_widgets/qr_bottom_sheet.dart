import 'dart:math';

import 'package:checkmark/checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/presentation/common_widgets/gradient_botton.dart';
import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';
import 'package:kma_reg/presentation/home/home_screen.dart';

enum SuccessOrFailure { success, failure }

class QrBottomSheet extends StatefulWidget {
  QrBottomSheet({
    super.key,
    required this.checkedInModel,
    required this.isSuccessorFailrue,
    this.errorMessage = "",
  }) {
    if (isSuccessorFailrue == SuccessOrFailure.success) {
      flag = true;
    }
  }
  final String? errorMessage;
  bool flag = false;
  final SuccessOrFailure isSuccessorFailrue;
  final CheckedInModel? checkedInModel;
  @override
  State<QrBottomSheet> createState() => _QrBottomSheetState();
}

class _QrBottomSheetState extends State<QrBottomSheet> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        checked = true;
      });
    });
    return BottomSheet(
      backgroundColor: Color.fromARGB(255, 249, 252, 255),
      constraints: BoxConstraints(
        maxHeight: widget.flag ? 670.h : 500.h,
        maxWidth: 393.w,
      ),
      onClosing: () {},
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kHeight30,
            Text(
              widget.flag ? "Successful" : "Failed",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: widget.flag ? 55.h : 30.h,
            ),
            widget.flag
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedScale(
                        scale: checked ? 2.3 : 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                        child: Image(
                          height: 70.w,
                          width: 70.w,
                          image: AssetImage("assets/celeb1.png"),
                        ),
                      ),
                      AnimatedScale(
                        scale: checked ? 2.1 : 1,
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
                              activeColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              active: checked,
                              curve: Curves.easeInOutCirc,
                              duration: const Duration(milliseconds: 1000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Image(
                    height: 95.w,
                    width: 95.w,
                    image: AssetImage("assets/fail.png"),
                  ),
            SizedBox(
              height: widget.flag ? 65.h : 30.h,
            ),
            widget.flag
                ? Container(
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          kHeight10,
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
                                  widget.checkedInModel!.name,
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
                                  widget.checkedInModel!.email,
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
                                  widget.checkedInModel!.transactionId,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Text(
                    widget.errorMessage!,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
            kHeight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyGradientButton(
                  text: "Return to home screen",
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  },
                ),
                kwidth10,
                MyGradientButton(
                  text: "Done",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const Spacer(),
            Image(image: AssetImage("assets/bottom_wave.png")),
          ],
        );
      },
    );
  }
}
