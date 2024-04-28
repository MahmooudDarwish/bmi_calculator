part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class BottomNavBarTappedEvent extends HomeEvent {
  final int index;
  final StatefulNavigationShell navigationShell;
  const BottomNavBarTappedEvent(
      {required this.index, required this.navigationShell});
  @override
  List<Object> get props => [index, navigationShell];
}

class SignOutEvent extends HomeEvent {
  const SignOutEvent();
  @override
  List<Object> get props => [];
}
