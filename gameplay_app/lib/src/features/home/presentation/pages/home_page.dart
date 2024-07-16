import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gameplay_app/core/control_auth/control_auth.cubit.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/src/features/home/presentation/widgets/home_list_classroom.dart';
import 'package:get_it/get_it.dart';

import '../widgets/home_categories.dart';
import '../widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                HomeHeader(),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32),
                      HomeCategories(),
                      SizedBox(height: 32),
                      HomeListClassRooms()
                    ],
                  ),
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
      ),
    );
  }
}
