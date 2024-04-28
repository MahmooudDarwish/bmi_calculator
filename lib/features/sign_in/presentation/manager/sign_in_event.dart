part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInButtonPressedEvent extends SignInEvent {
  const SignInButtonPressedEvent();
  @override
  List<Object?> get props => [];
}
