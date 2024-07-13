import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onTapLogin,
    required this.onTapRegister,
  });

  final VoidCallback onTapRegister;
  final VoidCallback onTapLogin;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      key: const ValueKey<int>(0),
      constraints: const BoxConstraints(
        maxWidth: 270,
      ),
      child: Column(
        children: [
          const Text(
            "Conecte-se e organize suas jogatinas",
            style: TextStyle(
              color: AppColors.textHeading,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Crie grupos para jogar seus games favoritos com seus amigos",
            style: TextStyle(
              color: AppColors.textHeading,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: onTapRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Registrar-se",
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
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onTapLogin,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide.none,
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
            ],
          ),
        ],
      ),
    );
  }
}
