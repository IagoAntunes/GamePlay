import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/src/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:gameplay_app/src/features/auth/presentation/states/auth_state.dart';
import 'package:gameplay_app/src/features/auth/presentation/widgets/login_widget.dart';
import 'package:gameplay_app/src/features/auth/presentation/widgets/onboarding_widget.dart';
import 'package:gameplay_app/src/features/auth/presentation/widgets/register_widget.dart';
import 'package:get_it/get_it.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

enum OnBoardingState { onboarding, register, login }

class _OnBoardingPageState extends State<OnBoardingPage> {
  OnBoardingState _currentState = OnBoardingState.onboarding;

  void _setState(OnBoardingState state) {
    setState(() {
      _currentState = state;
    });
  }

  void backToOnBoarding() {
    setState(() {
      _currentState = OnBoardingState.onboarding;
    });
  }

  bool showImages = true;

  final _keyAnimate = GlobalKey();

  final cubit = GetIt.I.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: BlocConsumer(
        listener: (context, state) {
          if (state is SuccessAuthListener) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Usuário criado com sucesso!'),
              ),
            );
            backToOnBoarding();
          } else if (state is FailureAuthListener) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message.isEmpty
                    ? 'Erro ao criar usuário!'
                    : state.message),
              ),
            );
          }
        },
        listenWhen: (previous, current) => current is IAuthListener,
        buildWhen: (previous, current) => current is! IAuthListener,
        bloc: cubit,
        builder: (context, state) {
          return Stack(
            children: [
              AnimatedOpacity(
                opacity:
                    MediaQuery.of(context).viewInsets.bottom <= 0 ? 1.0 : 0.3,
                duration: const Duration(milliseconds: 500),
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.background.withOpacity(1.0),
                        AppColors.background.withOpacity(0.5),
                        AppColors.background.withOpacity(0.0),
                      ],
                      stops: const [0.5, 0.75, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/images/on_boarding_background.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/images/lee_background.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                key: _keyAnimate,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 5),
                bottom: MediaQuery.of(context).viewInsets.bottom <= 0 ? 80 : 0,
                left: 0,
                right: 0,
                top: MediaQuery.of(context).viewInsets.bottom <= 0 ? null : 100,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: _getCurrentContent(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getCurrentContent() {
    switch (_currentState) {
      case OnBoardingState.onboarding:
        return OnboardingWidget(
          onTapLogin: () => _setState(OnBoardingState.login),
          onTapRegister: () => _setState(OnBoardingState.register),
        );
      case OnBoardingState.register:
        return RegisterWidget(
          onTapBack: backToOnBoarding,
        );
      case OnBoardingState.login:
        return LoginWidget(
          onTapBack: backToOnBoarding,
        );
    }
  }
}
