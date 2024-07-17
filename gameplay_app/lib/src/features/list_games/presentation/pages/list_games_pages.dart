import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/src/features/list_games/presentation/cubits/list_games_cubit.dart';
import 'package:gameplay_app/src/features/list_games/presentation/states/list_games_state.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';

class ListGamesPage extends StatefulWidget {
  const ListGamesPage({super.key});

  @override
  State<ListGamesPage> createState() => _ListGamesPageState();
}

class _ListGamesPageState extends State<ListGamesPage> {
  final _gamesListCubit = GetIt.I.get<GameListCubit>();

  @override
  void initState() {
    super.initState();
    _gamesListCubit.getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Lista de Jogos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.boxes1,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: BlocBuilder(
          bloc: _gamesListCubit,
          builder: (context, state) {
            return switch (_gamesListCubit.state) {
              LoadingGameListState() => const Center(
                  child: CircularProgressIndicator(),
                ),
              (SuccessGameListState successState) => ListView.separated(
                  itemCount: successState.games.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Navigator.pop(
                        context,
                        successState.games[index],
                      );
                    },
                    leading: Image.network(
                      successState.games[index].imageUrl,
                    ),
                    title: Text(
                      successState.games[index].name,
                      style: const TextStyle(
                        color: AppColors.textHeading,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_right),
                  ),
                ),
              _ => Container(),
            };
          },
        ),
      ),
    );
  }
}
