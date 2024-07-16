import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/bindings/app_binding.dart';
import 'package:gameplay_app/core/control_auth/control_auth.cubit.dart';
import 'package:gameplay_app/core/control_auth/control_auth_state.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocListener(
        listener: (context, state) {
          print("Oi");
          if (state is LogoutControlAuthListener) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OnBoardingPage()),
            );
          } else if (state is LoggedControlAuthListener) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
        bloc: _cubit,
        child:
            _cubit.state.isAuthenticated ? HomePage() : const OnBoardingPage(),
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
