import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/c_text_field.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({
    super.key,
    required this.onTapBack,
  });

  final VoidCallback onTapBack;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
          ),
          const SizedBox(height: 16),
          CTextFormField(
            textEditingController: passwordController,
            labelText: 'Senha',
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: AppColors.textHeading,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onTapBack,
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
