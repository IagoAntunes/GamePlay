import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/create_game_room/presentation/pages/create_gameroom_page.dart';
import 'package:gameplay_app/src/features/home/presentation/cubits/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final _homeCubit = GetIt.I.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _homeCubit.getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _homeCubit,
      builder: (context, state) {
        return Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.person_2_outlined,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Olá, ",
                      style: TextStyle(
                        color: AppColors.textHeading,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      _homeCubit.username,
                      style: const TextStyle(
                        color: AppColors.textHeading,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Hoje é o dia de vitória",
                  style: TextStyle(
                    color: AppColors.textBody,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              width: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateGameRoomPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: AppColors.primary,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
