part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// event trigger when authentication started
class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationStateChanged extends AuthenticationEvent {
  final AuthenticationDetail authenticationDetail;
  AuthenticationStateChanged({
    required this.authenticationDetail,
  });
  @override
  List<Object> get props => [authenticationDetail];
}

///event starts when user clicks on login with google
class AuthenticationGoogleStarted extends AuthenticationEvent {}

///event when user logout
class AuthenticationExited extends AuthenticationEvent {}
