import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elijah/navigation/cubit/navigation_cubit.dart';
import 'package:flutter_elijah/navigation/navigation.dart';

class NavigateWidget extends StatelessWidget {
  const NavigateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        context.select((NavigationCubit cubit) => cubit.state.navigationIndex);
    final mobileMode = MediaQuery.of(context).size.width < 600;

    return Visibility(
      visible: !mobileMode,
      child: NavigationRail(
        elevation: 10,
        extended: false,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          context.read<NavigationCubit>().changeIndex(index);
          jumpTo(navigationIcons[index]['label']);
        },
        labelType: NavigationRailLabelType.selected,
        destinations: navigationIcons
            .map((entry) => NavigationRailDestination(
                icon: Icon(
                  entry['icon'] as IconData,
                ),
                selectedIcon: Icon(
                  entry['selectedIcon'] as IconData,
                ),
                label: Text(entry['label'] as String)))
            .toList(),
      ),
    );
  }
}

class NavigateIconButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool hiding;

  const NavigateIconButton(
    this.text,
    this.iconData,
    this.hiding, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: hiding ? mediaQuery.size.width / 8 : null,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 0, left: 14),
        leading: Icon(
          iconData,
          size: hiding ? 30 : 20,
        ),
        title: hiding
            ? null
            : Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall!.apply(),
              ),
        onTap: () {
          jumpTo(text);
        },
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(children: [
        const DrawerHeader(
          padding: EdgeInsets.only(right: 30, top: 30, bottom: 30),
          child: FlutterLogo(),
        ),
        ...navigationIcons
            .asMap()
            .entries
            .map((entry) => ListTile(
                onTap: () {
                  context.read<NavigationCubit>().changeIndex(entry.key);
                  jumpTo(entry.value['label']);
                },
                leading: Icon(
                  entry.value['icon'] as IconData,
                ),
                title: Text(entry.value['label'] as String)))
            .toList(),
      ]),
    );
  }
}

void jumpTo(text) {
  Scrollable.ensureVisible(dataKeys[text]!.currentContext!);
}
