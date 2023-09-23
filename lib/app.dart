import 'package:flutter/material.dart';

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
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        switch (state.runtimeType) {
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
            return Container();
        }
      },
    );
  }
}
