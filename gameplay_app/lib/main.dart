import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/bindings/app_binding.dart';
import 'package:gameplay_app/core/control_auth/control_auth.cubit.dart';
import 'package:gameplay_app/core/control_auth/control_auth_state.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/core/url/app_keys_keyvalue_storage.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';
import 'package:gameplay_app/src/features/auth/presentation/pages/onboarding_page.dart';
import 'package:gameplay_app/src/features/home/presentation/bindings/home_binding.dart';
import 'package:gameplay_app/src/features/home/presentation/pages/home_page.dart';
import 'package:get_it/get_it.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await AppBinding.setUp();
  await HomeBinding.setUp();
  var secureStorage = GetIt.I.get<ISecureStorage>();

  var token = await secureStorage.get<String>(AppKeysKeyValueStorage.token);
  if (token != null && token.isNotEmpty) {
    GetIt.I.get<ControlAuthCubit>().state.isAuthenticated = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _cubit = GetIt.I.get<ControlAuthCubit>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GamePlay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.boxes1,
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.boxes1,
          surfaceTintColor: Colors.white,
          dayStyle: const TextStyle(
            color: Colors.white,
          ),
          weekdayStyle: const TextStyle(
            color: Colors.white,
          ),
          yearStyle: const TextStyle(
            color: Colors.white,
          ),
          dayForegroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return Colors.white;
          }),
          yearForegroundColor:
              const MaterialStatePropertyAll<Color>(Colors.white),
          headerForegroundColor: Colors.white,
          rangePickerHeaderForegroundColor: Colors.white,
          todayForegroundColor:
              const MaterialStatePropertyAll<Color>(Colors.white),
          rangeSelectionOverlayColor:
              const MaterialStatePropertyAll<Color>(Colors.white),
          rangePickerSurfaceTintColor: Colors.white,
          dayOverlayColor:
              const MaterialStatePropertyAll<Color>(AppColors.boxes2),
          headerHeadlineStyle: const TextStyle(
            color: Colors.white,
          ),
          headerHelpStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        timePickerTheme: const TimePickerThemeData(
          backgroundColor: AppColors.boxes1,
          dialBackgroundColor: AppColors.boxes2,
          dialTextColor: Colors.white,
          dialTextStyle: TextStyle(
            color: Colors.white,
          ),
          dayPeriodColor: AppColors.boxes2,
          dayPeriodTextColor: Colors.white,
          hourMinuteColor: AppColors.boxes2,
          hourMinuteTextColor: Colors.white,
          timeSelectorSeparatorColor: MaterialStatePropertyAll(
            Colors.white,
          ),
          helpTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: BlocListener(
        listener: (context, state) {
          if (state is LogoutControlAuthListener) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnBoardingPage()),
            );
          } else if (state is LoggedControlAuthListener) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        bloc: _cubit,
        child: _cubit.state.isAuthenticated
            ? const HomePage()
            : const OnBoardingPage(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
// Terminar pós(Longo Prazo)
// Especializar em serviços externos

// Realizar cursos alura Android
// Especializar Kotlin - BackEnd
// Especializar Flutter