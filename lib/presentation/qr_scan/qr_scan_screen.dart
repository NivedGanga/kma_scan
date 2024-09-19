import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kma_reg/application/check/check_cubit.dart';
import 'package:kma_reg/application/set_count/set_count_cubit.dart';
import 'package:kma_reg/domain/api_calls/models/update_count_model.dart';
import 'package:kma_reg/domain/checkin_type/check_in_type.dart';
import 'package:kma_reg/domain/failure/main_failure.dart';
import 'package:kma_reg/presentation/common_widgets/qr_bottom_sheet.dart';

import 'package:kma_reg/presentation/core/color.dart';
import 'package:kma_reg/presentation/core/constants.dart';
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
      {required UpdateCountModel? updateCountModel,
      required SheetType sheetType,
      required String? failure,
      bool isQRMode = true}) {
    Future<void> future = showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return QrBottomSheet(
          sheetType: sheetType,
          updateCountModel: updateCountModel,
          errorMessage: failure,
        );
      },
    );
    future.then((void value) async {
      await Future.delayed(Duration(milliseconds: 200));
      BlocProvider.of<CheckCubit>(context).resetState();
      BlocProvider.of<SetCountCubit>(context).resetState();
      if (isQRMode) {
        controller.start();
      }
    });
  }

  final transactionIdController = TextEditingController();
  ValueNotifier<bool> isQr = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context1) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocConsumer<CheckCubit, CheckState>(
          listener: (context, state) {
            state.isSuccessorFailrue.fold(() => null, (a) {
              a.fold((l) {
                if (l is OtherFailure) {
                  _showModal(
                    context,
                    isQRMode: isQr.value,
                    sheetType: SheetType.failure,
                    updateCountModel: null,
                    failure: l.message,
                  );
                } else if (l == const MainFailure.clientFailure()) {
                  _showModal(
                    context,
                    isQRMode: isQr.value,
                    sheetType: SheetType.failure,
                    updateCountModel: null,
                    failure: "Client Failure",
                  );
                } else if (l == const MainFailure.serverFailure()) {
                  _showModal(context,
                      isQRMode: isQr.value,
                      updateCountModel: null,
                      sheetType: SheetType.failure,
                      failure: "Server Failure");
                }
              }, (r) {
                transactionIdController.clear();
                _showModal(
                  context,
                  isQRMode: isQr.value,
                  sheetType: SheetType.countSet,
                  updateCountModel: state.updateCountModel!,
                  failure: null,
                );
              });
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
                ValueListenableBuilder(
                    valueListenable: isQr,
                    builder: (context, isQRMode, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back),
                              ),
                              Text(
                                isQRMode
                                    ? "Scan QR Code"
                                    : "Enter Transaction ID",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(83, 83, 83, 1),
                                ),
                              ),
                              isQRMode
                                  ? IconButton(
                                      onPressed: () {
                                        controller.stop();
                                        isQr.value = false;
                                      },
                                      icon: Icon(
                                        Icons.keyboard_alt_outlined,
                                        size: 25.sp,
                                      ))
                                  : IconButton(
                                      onPressed: () {
                                        controller.start();
                                        BlocProvider.of<CheckCubit>(context)
                                            .resetState();
                                        isQr.value = true;
                                      },
                                      icon: Icon(
                                        Icons.qr_code_scanner,
                                        size: 25.sp,
                                      ))
                            ],
                          ),
                          kHeight30,
                          qrMode(state, isQRMode),
                          kHeight30,
                          kHeight30,
                        ],
                      );
                    })
              ],
            );
          },
        ));
  }

  final _formKey = GlobalKey<FormState>();
  List<Widget> manualMode(state) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: transactionIdController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Transaction ID cannot be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Transaction ID",
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(83, 83, 83, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r),
                borderSide: BorderSide(
                  color: Color.fromRGBO(83, 83, 83, 1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r),
                borderSide: BorderSide(
                  color: Color.fromRGBO(83, 83, 83, 1),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  transactionIdController.clear();
                },
                child: Icon(
                  Icons.clear,
                  size: 20.sp,
                  color: Color.fromRGBO(83, 83, 83, 1),
                ),
              ),
            ),
          ),
        ),
      ),
      kHeight30,
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kprimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
          ),
          elevation: 5,
        ),
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            FocusManager.instance.primaryFocus?.unfocus();
            BlocProvider.of<CheckCubit>(context).checkWithTransactionId(
              transactionId: transactionIdController.text,
            );
          }
        },
        child: Text(
          "Check In",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      )
    ];
  }

  SizedBox qrMode(CheckState state, bool isQRMode) {
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
              if (isQRMode)
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
              if (!isQRMode)
                if (state.isLoading || state.isSuccessorFailrue.isSome())
                  Center(
                    child: SpinKitWaveSpinner(
                      color: kprimaryColor,
                      size: 70.w,
                      waveColor: kprimaryLightColor,
                    ),
                  )
                else
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: manualMode(state),
                  )
            ],
          );
        },
      ),
    );
  }
}
