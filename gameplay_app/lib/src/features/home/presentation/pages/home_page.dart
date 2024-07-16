import 'package:flutter/material.dart';
import 'package:gameplay_app/core/control_auth/control_auth.cubit.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:get_it/get_it.dart';

import '../widgets/home_categories.dart';
import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Column(
            children: [
              HomeHeader(),
              const Column(
                children: [
                  SizedBox(height: 32),
                  HomeCategories(),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final _cubit = GetIt.I.get<ControlAuthCubit>();
          _cubit.logout();
        },
      ),
    );
  }
}
