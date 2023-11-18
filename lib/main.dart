import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/presentation/home/home_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      builder: (context, widget) {
        return MaterialApp(
          title: 'KMA',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color.fromRGBO(232, 254, 255, 1),
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
