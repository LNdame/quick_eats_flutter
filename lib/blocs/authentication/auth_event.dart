import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const[]]);
}

class AppStarted extends AuthenticationEvent{
  @override
  List<Object> get props => [];

}

class LoggedIn extends AuthenticationEvent{
  final String token;
  final String user;
  LoggedIn(this.token, this.user);

  @override
  List<Object> get props => [token];
}

class LoggedOut extends AuthenticationEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}


abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed(this.username,this.password);

  @override
  List<Object> get props => [username, password];

  @override
  String toString() => 'LoginButtonPressed { username: $username, password: $password }';

}