import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/home/presentation/cubits/home_list_game_room_cubit.dart';
import 'package:gameplay_app/src/features/home/presentation/states/home_list_game_room_state.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';

class HomeListClassRooms extends StatefulWidget {
  const HomeListClassRooms({super.key});

  @override
  State<HomeListClassRooms> createState() => _HomeListClassRoomsState();
}

class _HomeListClassRoomsState extends State<HomeListClassRooms> {
  final _homeListGameRoomCubit = GetIt.I.get<HomeListGameRoomCubit>();

  @override
  void initState() {
    super.initState();
    _homeListGameRoomCubit.getAllGameRooms();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _homeListGameRoomCubit,
      builder: (context, state) => switch (_homeListGameRoomCubit.state) {
        LoadingHomeListGameRoomState() => const Center(
            child: CircularProgressIndicator(),
          ),
        (SuccessHomeListGameRoomState successState) => Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Partidas agendadas",
                      style: TextStyle(
                        color: AppColors.textHeading,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total: ${successState.gameRooms.length}",
                      style: const TextStyle(
                        color: AppColors.textBody,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (successState.gameRooms.isEmpty)
                  const Center(
                    child: Text(
                      "Nenhuma partida agendada",
                      style: TextStyle(
                        color: AppColors.textBody,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                else
                  Flexible(
                    child: ListView.separated(
                      itemCount: successState.gameRooms.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Divider(
                          color: AppColors.boxes1,
                        ),
                      ),
                      itemBuilder: (context, index) => ListTile(
                        leading: Image.network(
                          successState.gameRooms[index].game.imageUrl,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              successState.gameRooms[index].description,
                              style: const TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              successState.gameRooms[index].category.name,
                              style: const TextStyle(
                                color: AppColors.textBody,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 2),
                            Text(
                              successState.gameRooms[index].game.name,
                              style: const TextStyle(
                                color: AppColors.textBody,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: AppColors.primary,
                                    ),
                                    Text(
                                      "Sex 18/06 ás 21:00h",
                                      style: TextStyle(
                                        color: AppColors.textHeading,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: AppColors.primary,
                                    ),
                                    Text(
                                      successState
                                          .gameRooms[index].listPlayers.length
                                          .toString(),
                                      style: const TextStyle(
                                        color: AppColors.textHeading,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        FailureHomeListGameRoomState() => Container(),
        _ => Container(),
      },
    );
  }
}
