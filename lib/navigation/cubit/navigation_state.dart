part of 'navigation_cubit.dart';

class NavigationState {
  const NavigationState(
      {this.changingNavigationIndex = false, this.navigationIndex = 0});

  final int? navigationIndex;
  final bool changingNavigationIndex;
}

class NavigationInitial extends NavigationState {}
