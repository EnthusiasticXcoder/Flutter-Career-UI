import 'package:flutter/material.dart';
import 'package:fluttercareerui/helpers/loading_screen.dart';
import 'package:fluttercareerui/helpers/shaders/gradient_shader.dart';

import 'services/django_api_service.dart';

import 'bloc/bloc.dart';
import 'pages/auth/view/views.dart';
import 'pages/main/view/main_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MainBloc>().add(
          const MainEventInitialise(),
        );
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state.isLoading) LoadingScreen.showLoadingScreen(context);
        LoadingScreen.hideLoadingScreen(context);
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case MainStateUninitialised:
            return Scaffold(
              body: CustomPaint(
                painter: GradientPainter(),
              ),
            );
          case MainStateLogIn:
            return LogInView();
          case MainStateRegister:
            return RegisterView();
          case MainStateLoggedOut:
            return const WelcomeView();
          case MainStateLoggedIn:
            return BlocProvider(
              create: (context) => BlogBloc(DjangoAPIservice.fromBackend()),
              child: const MainView(),
            );
          default:
            return Scaffold(
              body: CustomPaint(
                painter: GradientPainter(),
              ),
            );
        }
      },
    );
  }
}
