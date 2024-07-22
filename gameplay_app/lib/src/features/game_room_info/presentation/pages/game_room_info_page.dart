import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/src/features/game_room_info/presentation/cubits/game_room_info_cubit.dart';
import 'package:gameplay_app/src/features/home/domain/models/game_model.dart';
import 'package:gameplay_app/src/features/home/domain/models/game_room_model.dart';
import 'package:get_it/get_it.dart';

import '../../../home/domain/models/game_room_players_model.dart';
import '../../../home/domain/models/user_model.dart';
import '../../../home/presentation/cubits/home_cubit.dart';
import '../states/game_room_info_stte.dart';

class GameRoomInfo extends StatefulWidget {
  const GameRoomInfo({
    super.key,
    required this.gameRoom,
  });

  final GameRoomModel gameRoom;

  @override
  State<GameRoomInfo> createState() => _GameRoomInfoState();
}

class _GameRoomInfoState extends State<GameRoomInfo> {
  final _cubitGameRoomInfo = GetIt.I.get<GameRoomInfoCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Game Room Info",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: AppColors.boxes1,
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          HeadGameRoomInfo(
            game: widget.gameRoom.game,
          ),
          BlocConsumer(
            bloc: _cubitGameRoomInfo,
            listener: (context, state) {
              if (state is SuccessGameRoomInfoListener) {
                final homeCubit = GetIt.I.get<HomeCubit>();
                widget.gameRoom.listPlayers.add(
                  GameRoomPlayersModel(
                    id: '0',
                    user: UserModel(
                      id: _cubitGameRoomInfo.idUser.toString(),
                      name: homeCubit.username,
                    ),
                  ),
                );
              } else if (state is FailureGameRoomInfoListener) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Erro ao entrar na partida"),
                  ),
                );
              }
            },
            listenWhen: (previous, current) => current is IGameRoomInfoListener,
            buildWhen: (previous, current) => current is! IGameRoomInfoListener,
            builder: (context, state) {
              return Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Jogadores",
                            style: TextStyle(
                              color: AppColors.textHeading,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Total ${widget.gameRoom.listPlayers.length}",
                            style: const TextStyle(
                              color: AppColors.textBody,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget.gameRoom.listPlayers.length,
                          itemBuilder: (context, index) => ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: AppColors.boxes1,
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              widget.gameRoom.listPlayers[index].user.name,
                              style: const TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              widget.gameRoom.listPlayers[index].user.name ==
                                      widget.gameRoom.userOwner.name
                                  ? "Dono da partida"
                                  : "Jogador",
                              style: const TextStyle(
                                color: AppColors.textBody,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: FutureBuilder(
                            future: _cubitGameRoomInfo.getIdUser(),
                            builder: (context, snapshot) {
                              return ElevatedButton(
                                onPressed: (snapshot.data ==
                                            widget.gameRoom.userOwner.id ||
                                        widget.gameRoom.listPlayers
                                            .where((element) =>
                                                element.user.id ==
                                                snapshot.data)
                                            .isNotEmpty)
                                    ? null
                                    : () {
                                        _cubitGameRoomInfo.enterGameRoom(
                                          int.parse(widget.gameRoom.id),
                                        );
                                      },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: AppColors.primary,
                                  disabledBackgroundColor:
                                      AppColors.primary.withOpacity(0.5),
                                ),
                                child: state is LoadingGameRoomInfoState
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Entrar na partida",
                                        style: TextStyle(
                                          color: AppColors.textHeading,
                                          fontSize: 15,
                                        ),
                                      ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HeadGameRoomInfo extends StatelessWidget {
  const HeadGameRoomInfo({
    super.key,
    required this.game,
  });
  final GameModel game;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.background.withOpacity(1.0),
                AppColors.background.withOpacity(0.6),
                AppColors.background.withOpacity(0.2),
              ],
              stops: const [0.5, 0.75, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: Image.network(
              game.bannerUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.name,
                style: const TextStyle(
                  color: AppColors.textHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: const Text(
                  "É hoje que vamos chegar ao challenger sem perder uma partida da md10",
                  style: TextStyle(
                    color: AppColors.textHeading,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
