import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameplay_app/core/theme/app_colors.dart';
import 'package:gameplay_app/core/url/app_assets_urls.dart';
import 'package:gameplay_app/src/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:gameplay_app/src/features/auth/presentation/states/auth_state.dart';
import 'package:gameplay_app/src/features/auth/presentation/widgets/login_widget.dart';
import 'package:gameplay_app/src/features/auth/presentation/widgets/onboarding_widget.dart';
import 'package:gameplay_app/src/features/auth/presentation/widgets/register_widget.dart';
import 'package:gameplay_app/src/features/home/presentation/pages/home_page.dart';
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

  void _loginListeners(Object? state) {
    if (state is SuccessLoginListener) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login realizado com sucesso!'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else if (state is FailureLoginListener) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message.isEmpty
              ? 'Erro ao realizar login!'
              : state.message),
        ),
      );
    }
  }

  void _registerListeners(Object? state) {
    if (state is SuccessRegisterListener) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
        ),
      );
    } else if (state is FailureRegisterListener) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message.isEmpty
              ? 'Erro ao realizar cadastro!'
              : state.message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: false,
      body: BlocConsumer(
        listener: (context, state) {
          _registerListeners(state);
          _loginListeners(state);
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
                          AppAssetsUrls.onBoardingBack,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          AppAssetsUrls.leeBackground,
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
