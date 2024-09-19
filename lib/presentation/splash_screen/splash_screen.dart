import 'package:flutter/material.dart';
import 'package:kma_reg/presentation/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ValueNotifier<double> opacityNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      opacityNotifier.value = 1;
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ), (route) => false);
      });
    });
    return Scaffold(
      body: Center(
          child: ValueListenableBuilder(
              valueListenable: opacityNotifier,
              builder: (context, opacity, _) {
                return AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(milliseconds: 500),
                  child: Image(
                    image: AssetImage("assets/splash.png"),
                    width: 350,
                    fit: BoxFit.fitWidth,
                  ),
                );
              })),
    );
  }
}
