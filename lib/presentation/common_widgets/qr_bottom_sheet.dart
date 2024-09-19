import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:kma_reg/application/set_count/set_count_cubit.dart';

import 'package:kma_reg/domain/api_calls/models/update_count_model.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';
import 'package:kma_reg/presentation/common_widgets/bottom_bar_buttons.dart';
import 'package:kma_reg/presentation/common_widgets/failure_widget.dart';
import 'package:kma_reg/presentation/common_widgets/success_widget.dart';

import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';

import 'package:kma_reg/presentation/qr_scan/widgets/count_set_widget.dart';

enum SheetType { success, failure, countSet }

class QrBottomSheet extends StatefulWidget {
  QrBottomSheet({
    super.key,
    required this.updateCountModel,
    required this.sheetType,
    this.errorMessage = "",
  }) {
    if (sheetType != SheetType.failure) {
      flag = true;
    }
  }

  String? errorMessage;
  bool flag = false;
  SheetType sheetType;
  final UpdateCountModel? updateCountModel;
  @override
  State<QrBottomSheet> createState() => _QrBottomSheetState();
}

class _QrBottomSheetState extends State<QrBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetCountCubit, SetCountState>(
      builder: (context, state) {
        state.isSuccessorFailrue.fold(() {}, (a) {
          a.fold((l) {
            if (l is OtherFailure) {
              widget.errorMessage = l.message;
            } else if (l == const MainFailure.clientFailure()) {
              widget.errorMessage = "Something went wrong";
            } else if (l == const MainFailure.serverFailure()) {
              widget.errorMessage = "Server Failure";
            }
            widget.flag = false;
            widget.sheetType = SheetType.failure;
          }, (r) {
            widget.sheetType = SheetType.success;
          });
        });
        return BottomSheet(
          enableDrag: false,
          backgroundColor: Color.fromARGB(255, 249, 252, 255),
          constraints: BoxConstraints(
            maxHeight: widget.sheetType == SheetType.failure ? 500.h : 670.h,
            maxWidth: 393.w,
          ),
          onClosing: () {},
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (state.isLoading)
                  Expanded(
                    child: Center(
                      child: SpinKitWaveSpinner(
                        color: kprimaryColor,
                        size: 70.w,
                        waveColor: kprimaryLightColor,
                      ),
                    ),
                  )
                else if (widget.flag)
                  if (widget.sheetType == SheetType.success)
                    SuccessWidget(checkedInModel: state.checkedInModel!)
                  else
                    CountSetWidget(updateCountModel: widget.updateCountModel!)
                else
                  FailureWidget(errorMessage: widget.errorMessage!),
                kHeight30,
                if (widget.sheetType != SheetType.countSet)
                  const BottomBarButtons(),
                if (!state.isLoading) const Spacer(),
                Image(
                  width: 393.w,
                  height: 150.h,
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/bottom_wave.png"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
