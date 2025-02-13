part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class OnChangePasswordEvent extends RegistrationEvent {
  final String password;

  OnChangePasswordEvent({required this.password});
}

class OnChangeConfirmPasswordEvent extends RegistrationEvent {
  final String password;

  OnChangeConfirmPasswordEvent({required this.password});
}

class OnSelectOptionHowDoYouKnowEvent extends RegistrationEvent {
  final Option option;

  OnSelectOptionHowDoYouKnowEvent({required this.option});
}
