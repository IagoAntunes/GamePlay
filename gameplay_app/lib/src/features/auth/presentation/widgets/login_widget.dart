import 'package:flutter/material.dart';
import 'package:gameplay_app/src/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/c_text_field.dart';
import '../states/auth_state.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    required this.onTapBack,
  });

  final VoidCallback onTapBack;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final _authCubit = GetIt.I.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      key: const ValueKey<int>(2),
      constraints: const BoxConstraints(
        maxWidth: 270,
      ),
      child: Column(
        children: [
          const Text(
            "Faça login",
            style: TextStyle(
              color: AppColors.textHeading,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          CTextFormField(
            textEditingController: usernameController,
            labelText: 'Usuário',
            enabled: _authCubit.state is! LoadingAuthState,
          ),
          const SizedBox(height: 16),
          CTextFormField(
            textEditingController: passwordController,
            labelText: 'Senha',
            enabled: _authCubit.state is! LoadingAuthState,
            obscureText: true,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                      onPressed: _authCubit.state is! LoadingAuthState
                          ? () {
                              _authCubit.login(
                                username: usernameController.text,
                                password: passwordController.text,
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _authCubit.state is! LoadingAuthState
                          ? const Text(
                              "Entrar",
                              style: TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: widget.onTapBack,
            child: const Text(
              "Voltar",
              style: TextStyle(
                color: AppColors.textHeading,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
