import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/core/widgets/c_text_field.dart';
import 'package:gameplay_app/src/features/create_class_room/presentation/cubits/create_gameroom_categories_cubit.dart';
import 'package:gameplay_app/src/features/create_class_room/presentation/cubits/create_gameroom_cubit.dart';
import 'package:gameplay_app/src/features/create_class_room/presentation/states/create_gameroom_state.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class CreateGameRoomPage extends StatefulWidget {
  const CreateGameRoomPage({super.key});

  @override
  State<CreateGameRoomPage> createState() => _CreateGameRoomPageState();
}

class _CreateGameRoomPageState extends State<CreateGameRoomPage> {
  final _createGameRoomCategoriesCubit =
      GetIt.I.get<CreateGameRoomCategoriesCubit>();

  final _createGameRoomCubit = GetIt.I.get<CreateGameRoomCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createGameRoomCategoriesCubit.getCategories();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder(
                bloc: _createGameRoomCategoriesCubit,
                builder: (context, state) =>
                    switch (_createGameRoomCategoriesCubit.state) {
                  LoadingCreateGameRoomState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  (SuccessCreateGameRoomState successState) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Categoria",
                          style: TextStyle(
                            color: AppColors.textHeading,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 120,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8),
                            itemCount: successState.listCategories.length,
                            itemBuilder: (context, index) => InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                //
                              },
                              child: Container(
                                constraints: const BoxConstraints(
                                  minWidth: 104,
                                  minHeight: 120,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: AppColors.stroke1,
                                    ),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.boxes2,
                                      AppColors.boxes1,
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 8),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Image.network(
                                        successState
                                            .listCategories[index].imageUrl,
                                        width: 48,
                                        height: 48,
                                      )),
                                      Text(
                                        successState.listCategories[index].name,
                                        style: const TextStyle(
                                          color: AppColors.textHeading,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  _ => Container(),
                },
              ),
              const SizedBox(height: 25),
              ClipRRect(
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
                        child: Container(),
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
                              lastDate:
                                  DateTime.now().add(const Duration(days: 31)),
                            ).then(
                              (value) {
                                if (value != null) {
                                  _dayMonthController.text = DateFormat('dd/MM')
                                      .format(DateTime.parse(value.toString()));

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
                            ).then(
                              (value) {
                                if (value != null) {
                                  _timeController.text = value.format(context);
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
                    disabledBackgroundColor: AppColors.primary.withOpacity(0.4),
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
          ),
        ),
      ),
    );
  }
}
