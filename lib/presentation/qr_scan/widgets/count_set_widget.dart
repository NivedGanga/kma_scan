import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/application/set_count/set_count_cubit.dart';
import 'package:kma_reg/domain/api_calls/models/update_count_model.dart';
import 'package:kma_reg/presentation/common_widgets/gradient_botton.dart';
import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';

class CountSetWidget extends StatefulWidget {
  CountSetWidget({super.key, required this.updateCountModel}) {
    registered = updateCountModel.totalCount;
    check = updateCountModel.currentCount + 1;
  }
  final UpdateCountModel updateCountModel;
  int check = 0;
  int registered = 0;
  @override
  State<CountSetWidget> createState() => _CountSetWidgetState();
}

class _CountSetWidgetState extends State<CountSetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight30,
        Text(
          "Select The Number of\n People Present",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 60.h,
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
                        widget.updateCountModel.name,
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
                        widget.updateCountModel.email,
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
                        widget.updateCountModel.transactionId,
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
        kHeight30,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.check > 0) {
                    widget.check--;
                  }
                });
              },
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  kprimaryLightColor,
                ),
              ),
            ),
            kwidth15,
            Text(
              "${widget.check} / ${widget.registered}",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            kwidth15,
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.check < widget.registered) {
                    widget.check++;
                  }
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  kprimaryLightColor,
                ),
              ),
            ),
          ],
        ),
        kHeight30,
        MyGradientButton(
          text: "Submit",
          onPressed: () {
            BlocProvider.of<SetCountCubit>(context).updateCount(
                count: widget.check, updateCountModel: widget.updateCountModel);
          },
        ),
        kHeight30,
      ],
    );
  }
}
