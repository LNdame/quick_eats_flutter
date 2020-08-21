import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props =>[];
}

class AuthenticationUninitialised extends AuthenticationState{}
class AuthenticationUnauthenticated extends AuthenticationState{}
class AuthenticationAuthenticated extends AuthenticationState{}
class AuthenticationLoading extends AuthenticationState{}


abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];

}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFailure extends LoginState {
  final dynamic error;
  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';

}