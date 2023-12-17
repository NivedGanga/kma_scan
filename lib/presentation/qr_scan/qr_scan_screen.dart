import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kma_reg/application/check/check_cubit.dart';
import 'package:kma_reg/domain/api_calls/models/check_model.dart';
import 'package:kma_reg/domain/api_calls/models/checked_in_model.dart';
import 'package:kma_reg/domain/checkin_type/check_in_type.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';
import 'package:kma_reg/presentation/common_widgets/qr_bottom_sheet.dart';
import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';
import 'package:kma_reg/presentation/home/wisgets/home_botton.dart';
import 'package:kma_reg/presentation/qr_scan/widgets/scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  MobileScannerController controller = MobileScannerController();
  Barcode? barcode;
  BarcodeCapture? capture;
  Future<void> onDetect(BarcodeCapture barcode) async {
    if (barcode.barcodes.first.displayValue == null ||
        this.barcode?.displayValue == barcode.barcodes.first.displayValue) {
      return;
    }
    capture = barcode;
    this.barcode = barcode.barcodes.first;
    controller.stop();
    BlocProvider.of<CheckCubit>(context).check(
        token: this.barcode?.displayValue ?? "",
        checkInType: CheckInType.checkIn);
  }

  final scanWindow = Rect.fromCenter(
    center: Offset(162.w, 263.5.h),
    width: 150,
    height: 150,
  );
  @override
  void initState() {
    BlocProvider.of<CheckCubit>(context).resetState();
    super.initState();
  }

  _showModal(BuildContext context,
      {required CheckedInModel? checkedInModel,
      required SuccessOrFailure isSuccessorFailrue,
      required String? failure}) {
    Future<void> future = showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return QrBottomSheet(
          isSuccessorFailrue: isSuccessorFailrue,
          checkedInModel: checkedInModel,
          errorMessage: failure,
        );
      },
    );
    future.then((void value) {
      controller.start();
      BlocProvider.of<CheckCubit>(context).resetState();
    });
  }

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocConsumer<CheckCubit, CheckState>(
          listener: (context, state) {
            state.isSuccessorFailrue.fold(() => null, (a) {
              a.fold(
                (l) {
                  if (l is OtherFailure) {
                    _showModal(
                      context,
                      isSuccessorFailrue: SuccessOrFailure.failure,
                      checkedInModel: null,
                      failure: l.message,
                    );
                  } else if (l == const MainFailure.clientFailure()) {
                    _showModal(
                      context,
                      isSuccessorFailrue: SuccessOrFailure.failure,
                      checkedInModel: null,
                      failure: "Client Failure",
                    );
                  } else if (l == const MainFailure.serverFailure()) {
                    _showModal(context,
                        checkedInModel: null,
                        isSuccessorFailrue: SuccessOrFailure.failure,
                        failure: "Server Failure");
                  }
                },
                (r) => _showModal(
                  context,
                  isSuccessorFailrue: SuccessOrFailure.success,
                  checkedInModel: state.checkedInModel!,
                  failure: null,
                ),
              );
            });
          },
          builder: (context2, state) {
            return Stack(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back),
                        ),
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
                    kHeight30,
                    QrMode(state),
                    kHeight30,
                    kHeight30,
                  ],
                )
              ],
            );
          },
        ));
  }

  SizedBox QrMode(CheckState state) {
    return SizedBox(
      height: 527.h,
      width: 324.w,
      child: Builder(
        builder: (context) {
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              MobileScanner(
                fit: BoxFit.cover,
                scanWindow: scanWindow,
                controller: controller,
                errorBuilder: (context, error, child) {
                  controller.stop();
                  controller.start();
                  return const SizedBox();
                },
                onDetect: onDetect,
                placeholderBuilder: (context, child) {
                  return const SizedBox();
                },
              ),
              if (state.isLoading || state.isSuccessorFailrue.isSome())
                Center(
                  child: SpinKitWaveSpinner(
                    color: kprimaryColor,
                    size: 70.w,
                    waveColor: kprimaryLightColor,
                  ),
                )
              else
                CustomPaint(
                  painter: ScannerOverlay(scanWindow),
                ),
            ],
          );
        },
      ),
    );
  }
}
