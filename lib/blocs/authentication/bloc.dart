import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quick_eats/blocs/authentication/auth_event.dart';
import 'package:quick_eats/src/datarepo/user_repository.dart';

import 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  @override
  AuthenticationState get initialState => AuthenticationUninitialised();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await UserRepository.hasToken();
      if (hasToken)
        yield AuthenticationAuthenticated();
      else
        yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await UserRepository.persistSession(event.token, event.user);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await UserRepository.deleteSession();
      yield AuthenticationUnauthenticated();
    }
  }
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final BuildContext context;

  LoginBloc(this.authenticationBloc, this.context)
      : assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final response = await UserRepository.authenticate({
          "email": event.username,
          "password": event.password,
        },context);
        if(response.error==null){
          final user = response.user;
          //persistUser(user);
          String userString = jsonEncode(user.toJson());
          var loggedIn = LoggedIn(response.accessToken, userString);
          authenticationBloc.add(loggedIn);
          yield LoginInitial();
        }
        else{
          yield LoginFailure(response.error);
        }
        
      } catch (error) {
        debugPrint(error.toString());
        yield LoginFailure(error.toString());
      }
    }
  }
}
