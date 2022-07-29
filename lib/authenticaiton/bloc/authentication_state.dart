part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}
/// state when authentication starts
class AuthenticationInitial extends AuthenticationState {}

//state when authentication is processing
class AuthenticationLoading extends AuthenticationState {}

///state when authentication is failed
class AuthenticationFailure extends AuthenticationState {
  final String message;
  AuthenticationFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

/// authentication success state
class AuthenticationSuccess extends AuthenticationState {
  final AuthenticationDetail authenticationDetail;
  AuthenticationSuccess({
    required this.authenticationDetail,
  });
  @override
  List<Object> get props => [authenticationDetail];
}
