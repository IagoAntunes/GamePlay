import 'package:flutter/material.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/src/features/home/presentation/widgets/home_list_classroom.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/control_auth/control_auth.cubit.dart';
import '../widgets/home_categories.dart';
import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final cubit = GetIt.I.get<ControlAuthCubit>();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.backgroundGradient1,
            AppColors.backgroundGradient2,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      cubit.logout();
                    },
                    child: const Text("add")),
                const HomeHeader(),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32),
                      HomeCategories(),
                      SizedBox(height: 32),
                      HomeListGameRooms()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
