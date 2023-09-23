import 'package:bloc/bloc.dart';
import 'package:fluttercareerui/services/service.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(APIDataProvider provider) : super(const MainStateUninitialised()) {
    on<MainEventInitialise>((event, emit) async {
      try {
        await provider.initialise();
        final user = provider.currentuser;
        if (user == null) {
          emit(const MainStateLoggedOut());
        } else {
          emit(const MainStateLoggedIn());
        }
      } on GenericAPICallException {
        emit(state);
      }
    });

    on<MainEventLogout>((event, emit) {
      emit(const MainStateLoggedOut());
    });

    on<MainEventLogin>((event, emit) async {
      if (event.username == null) {
        emit(const MainStateLogIn());
      } else {
        try {
          await provider.login(
            userName: event.username!,
            password: event.password!,
          );
          emit(const MainStateLoggedIn());
        } on InvalidCredentialsAPIException {
          emit(state);
        } on UnableToLoginUserAPIException {
          emit(state);
        } on GenericAPICallException {
          emit(state);
        }
      }
    });

    on<MainEventRegister>((event, emit) async {
      if (event.body == null) {
        emit(const MainStateRegister());
      } else {
        try {
          await provider.register(event.body!);
          emit(const MainStateLoggedIn());
        } on UnableToRegesterUserAPIException {
          // error message with same state
          emit(state);
        } on GenericAPICallException {
          // error message with same state
          emit(state);
        }
      }
    });
  }
}
