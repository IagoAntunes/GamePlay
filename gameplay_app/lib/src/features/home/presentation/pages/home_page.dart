import 'package:flutter/material.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/services/database/secure_storage/i_secure_storage.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          //
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var secureStorage = GetIt.I.get<ISecureStorage>();
          await secureStorage.set<String>("token", "oi");
          print(await secureStorage.get<String>("token"));
        },
      ),
    );
  }
}
