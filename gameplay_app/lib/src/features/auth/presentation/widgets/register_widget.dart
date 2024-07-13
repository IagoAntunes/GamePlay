import 'package:flutter/material.dart';
import 'package:gameplay_app/src/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/c_text_field.dart';
import '../states/auth_state.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({
    super.key,
    required this.onTapBack,
  });

  final VoidCallback onTapBack;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _keyForm = GlobalKey<FormState>();

  var authCubit = GetIt.I.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      key: const ValueKey<int>(1),
      constraints: const BoxConstraints(
        maxWidth: 270,
      ),
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            const Text(
              "Crie sua conta",
              style: TextStyle(
                color: AppColors.textHeading,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CTextFormField(
              textEditingController: usernameController,
              labelText: "Usuário",
              enabled: authCubit.state is! LoadingAuthState,
            ),
            const SizedBox(height: 16),
            CTextFormField(
              textEditingController: passwordController,
              obscureText: true,
              labelText: "Senha",
              enabled: authCubit.state is! LoadingAuthState,
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: authCubit.state is! LoadingAuthState
                          ? () {
                              if (usernameController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Preencha todos os campos"),
                                  ),
                                );
                              } else {
                                authCubit.registerUser(
                                  usernameController.text,
                                  passwordController.text,
                                );
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: authCubit.state is! LoadingAuthState
                          ? const Text(
                              "Registrar",
                              style: TextStyle(
                                color: AppColors.textHeading,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
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
      ),
    );
  }
}
