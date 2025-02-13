part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

class OnChangePasswordState extends RegistrationState {
  final String password;

  OnChangePasswordState({required this.password});
}

class OnChangeConfirmPasswordState extends RegistrationState {
  final String password;

  OnChangeConfirmPasswordState({required this.password});
}

class OnSelectOptionHowDoYouKnowState extends RegistrationState {
  final Option option;

  OnSelectOptionHowDoYouKnowState({required this.option});
}
