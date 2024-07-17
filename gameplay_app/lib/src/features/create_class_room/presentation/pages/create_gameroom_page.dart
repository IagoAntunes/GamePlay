import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/core/widgets/c_text_field.dart';
import 'package:gameplay_app/src/features/create_class_room/presentation/cubits/create_gameroom_cubit.dart';
import 'package:gameplay_app/src/features/list_games/presentation/pages/list_games_pages.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../widgets/create_gameroom_widget.dart';

class CreateGameRoomPage extends StatefulWidget {
  const CreateGameRoomPage({
    super.key,
    this.selectedCategory,
  });

  final int? selectedCategory;

  @override
  State<CreateGameRoomPage> createState() => _CreateGameRoomPageState();
}

class _CreateGameRoomPageState extends State<CreateGameRoomPage> {
  final _createGameRoomCubit = GetIt.I.get<CreateGameRoomCubit>();

  @override
  void initState() {
    super.initState();
  }

  final _dayMonthController = TextEditingController();
  final _timeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: const Text(
          "Criar partida",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.boxes1,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocBuilder(
            bloc: _createGameRoomCubit,
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CreateGameRoomCategories(
                    selectedCategory: widget.selectedCategory,
                  ),
                  const SizedBox(height: 25),
                  _SelectGame(createGameRoomCubit: _createGameRoomCubit),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dia e mês",
                              style: TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CTextFormField(
                              textEditingController: _dayMonthController,
                              readOnly: true,
                              hintText: 'dd/mm',
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 31)),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      _dayMonthController.text =
                                          DateFormat('dd/MM').format(
                                              DateTime.parse(value.toString()));

                                      _createGameRoomCubit
                                          .setDayMonth(value.toString());
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dia e mês",
                              style: TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CTextFormField(
                              textEditingController: _timeController,
                              readOnly: true,
                              hintText: 'hh:mm',
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder: _hourFormatBuilder,
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      _timeController.text =
                                          '${value.hour}:${value.minute}';
                                      _createGameRoomCubit
                                          .setTime(value.toString());
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Descrição",
                    style: TextStyle(
                      color: AppColors.textHeading,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CTextFormField(
                    textEditingController: _descriptionController,
                    hintText: '',
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _createGameRoomCubit.gameSelected == null
                          ? null
                          : () {
                              if (_timeController.text.isNotEmpty &&
                                  _dayMonthController.text.isNotEmpty &&
                                  _descriptionController.text.isNotEmpty) {
                                //
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Preencha todos os campos'),
                                  ),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        disabledBackgroundColor:
                            AppColors.primary.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Agendar",
                        style: TextStyle(
                          color: AppColors.textHeading,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _hourFormatBuilder(BuildContext context, Widget? child) {
    final mediaQueryData = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQueryData.alwaysUse24HourFormat
          ? mediaQueryData
          : mediaQueryData.copyWith(alwaysUse24HourFormat: true),
      child: child!,
    );
  }
}

class _SelectGame extends StatelessWidget {
  const _SelectGame({
    required CreateGameRoomCubit createGameRoomCubit,
  }) : _createGameRoomCubit = createGameRoomCubit;

  final CreateGameRoomCubit _createGameRoomCubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ListGamesPage(),
          ),
        ).then((value) {
          if (value != null) {
            _createGameRoomCubit.setGame(value);
          }
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.stroke1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.boxes1,
                      AppColors.boxes2,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: _createGameRoomCubit.gameSelected == null
                    ? Container()
                    : Image.network(
                        _createGameRoomCubit.gameSelected!.imageUrl,
                      ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 24),
                    Text(
                      "Selecione um Jogo",
                      style: TextStyle(
                        color: AppColors.textHeading,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.arrow_right,
                      color: AppColors.textBody,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
