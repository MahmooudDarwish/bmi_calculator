part of 'sign_in_bloc.dart';

@immutable
class SignInState extends Equatable {
  final RequestState getUserRequestState;
  final String getUserMessage;

  const SignInState({
    this.getUserRequestState = RequestState.idle,
    this.getUserMessage = '',
  });

  SignInState copyWith({
    RequestState? getUserRequestState,
    String? getUserMessage,
  }) =>
      SignInState(
        getUserMessage: getUserMessage ?? this.getUserMessage,
        getUserRequestState: getUserRequestState ?? this.getUserRequestState,
      );

  @override
  List<Object?> get props => [
        getUserRequestState,
        getUserMessage,
      ];
}

