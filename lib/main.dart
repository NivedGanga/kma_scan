import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kma_reg/application/check/check_cubit.dart';
import 'package:kma_reg/application/count/count_cubit.dart';
import 'package:kma_reg/domain/di/injectable.dart';
import 'package:kma_reg/presentation/home/home_screen.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjuction();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      builder: (context, widget) {
        return MultiBlocListener(
          listeners: [
            BlocProvider<CheckCubit>(
              create: (context) => getIt<CheckCubit>(),
            ),
            BlocProvider<CountCubit>(
              create: (context) => getIt<CountCubit>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'KMA',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Color.fromRGBO(232, 254, 255, 1),
            ),
            home: HomeScreen(),
          ),
        );
      },
    );
  }
}
