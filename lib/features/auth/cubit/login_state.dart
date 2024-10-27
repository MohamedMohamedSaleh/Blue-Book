part of 'login_cubit.dart';

@immutable
sealed class LoginCubitStates {}

final class LoginInitialState extends LoginCubitStates {}

final class LoginSuccessState extends LoginCubitStates {

}

final class LoginLoadingState extends LoginCubitStates {}

final class LoginFailureState extends LoginCubitStates {}
