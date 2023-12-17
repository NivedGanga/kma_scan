import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kma_reg/application/count/count_cubit.dart';
import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CountCubit>(context).fetchCount();
    });
    return Scaffold(
      body: BlocConsumer<CountCubit, CountState>(
        listener: (context, state) {
          state.isSuccessOrFailureOption.fold(
            () {},
            (a) {
              a.fold((l) {}, (r) => null);
            },
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: SpinKitWaveSpinner(
                color: kprimaryColor,
                size: 70.w,
                waveColor: kprimaryLightColor,
              ),
            );
          }
          if (state.isSuccessOrFailureOption.isNone()) {
            return SizedBox();
          }
          return Column(
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
              if (state.checkInCountModel != null)
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
                          "${state.checkInCountModel!.totalCountCheckIn}/${state.checkInCountModel!.totalRegistered}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${state.checkInCountModel!.totalCountCheckIn}",
                          style: TextStyle(
                            fontSize: 50.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Column(
                  children: [
                    Image(
                      height: 95.w,
                      width: 95.w,
                      image: AssetImage("assets/fail.png"),
                    ),
                    kHeight10,
                    Text(
                      "Something Went Wrong",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    kHeight10,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(193, 247, 255, 1),
                        elevation: 0,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {
                        BlocProvider.of<CountCubit>(context).fetchCount();
                      },
                      child: Text(
                        "Try again",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 55.h,
              ),
              Spacer(),
              Image(
                image: AssetImage(
                  "assets/qr_bottom.png",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
