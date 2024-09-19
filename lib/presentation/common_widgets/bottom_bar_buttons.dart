import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kma_reg/application/set_count/set_count_cubit.dart';
import 'package:kma_reg/presentation/common_widgets/gradient_botton.dart';
import 'package:kma_reg/presentation/core/constants.dart';
import 'package:kma_reg/presentation/home/home_screen.dart';

class BottomBarButtons extends StatelessWidget {
  const BottomBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
