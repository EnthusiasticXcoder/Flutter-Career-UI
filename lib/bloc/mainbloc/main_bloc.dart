import 'package:bloc/bloc.dart';
import 'package:fluttercareerui/services/service.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(APIDataProvider provider)
      : super(const MainStateUninitialised(isLoading: true)) {
    on<MainEventInitialise>((event, emit) async {
      try {
        emit(const MainStateUninitialised(isLoading: false));
        await provider.initialise();
        final user = provider.currentuser;
        if (user == null) {
          emit(const MainStateLoggedOut(isLoading: false));
        } else {
          emit(const MainStateLoggedIn(isLoading: false));
        }
      } on GenericAPICallException {
        emit(state);
      }
    });

    on<MainEventLogout>((event, emit) async {
      if (event.isLoggedIn) {
        emit(const MainStateLoggedIn(isLoading: true));
        await provider.logOut();
      }
      emit(const MainStateLoggedOut(isLoading: false));
    });

    on<MainEventLogin>((event, emit) async {
      if (event.username == null) {
        emit(const MainStateLogIn(isLoading: false));
      } else {
        try {
          emit(const MainStateLogIn(isLoading: true));
          await provider.login(
            userName: event.username!,
            password: event.password!,
          );
          emit(const MainStateLoggedIn(isLoading: false));
        } on InvalidCredentialsAPIException {
          emit(const MainStateLogIn(isLoading: false));
        } on UnableToLoginUserAPIException {
          emit(const MainStateLogIn(isLoading: false));
        } on GenericAPICallException {
          emit(const MainStateLogIn(isLoading: false));
        }
      }
    });

    on<MainEventRegister>((event, emit) async {
      if (event.body == null) {
        emit(const MainStateRegister(isLoading: false));
      } else {
        try {
          emit(const MainStateRegister(isLoading: true));
          await provider.register(event.body!);
          emit(const MainStateLoggedIn(isLoading: false));
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
