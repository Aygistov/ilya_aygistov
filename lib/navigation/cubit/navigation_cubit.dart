import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  changeIndex(int index) {
    emit(NavigationState(
      navigationIndex: index,
      changingNavigationIndex: true,
    ));
  }

  deactivateNavigation(NavigationState state) {
    emit(const NavigationState(
      navigationIndex: null,
      changingNavigationIndex: false,
    ));
  }

  deactivatechangingNavigationIndex(NavigationState state) {
    emit(NavigationState(
      navigationIndex: state.navigationIndex,
      changingNavigationIndex: false,
    ));
  }

  scrolling(NavigationState state) {
    if (!state.changingNavigationIndex && state.navigationIndex != null) {
      deactivateNavigation(state);
    } else {
      deactivatechangingNavigationIndex(state);
    }
  }
}
