part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final int selectedIndex;
  final RequestState signOutRequestState;
  final String signOutMessage;

  const HomeState(
      {this.selectedIndex = 0,
      this.signOutMessage = "",
      this.signOutRequestState = RequestState.idle});

  HomeState copyWith({
    int? selectedIndex,
    RequestState? signOutRequestState,
    String? signOutMessage,
  }) =>
      HomeState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        signOutRequestState: signOutRequestState ?? this.signOutRequestState,
        signOutMessage: signOutMessage ?? this.signOutMessage,
      );

  @override
  List<Object?> get props => [
        selectedIndex,
        signOutRequestState,
        signOutMessage,
      ];
}
