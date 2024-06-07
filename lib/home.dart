import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/navigation/navigation.dart';
import 'package:flutter_elijah/navigation/navigation_view.dart';
import 'package:flutter_elijah/sections/sections.dart';
import 'navigation/cubit/navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: const MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required,
  });

  @override
  Widget build(BuildContext context) {
    final mobileMode = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: mobileMode
          ? AppBar(
              backgroundColor: appColors['backGround4'],
            )
          : null,
      drawer: const DrawerWidget(),
      body: Container(
        color: appColors['backGround5'],
        child: const Row(
          children: [
            NavigateWidget(),
            HomeWidget(),
          ],
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            context.read<NavigationCubit>().scrolling(context.read<NavigationCubit>().state);
          }
          return true;
        },
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            children: <Widget>[
              HeadWidget(key: dataKeys['Home']),
              HeaderWidget('Profile', key: dataKeys['Profile']),
              const ProfileWidget(),
              HeaderWidget('Experience', key: dataKeys['Experience']),
              const ExperienceWidget(),
              HeaderWidget('Education', key: dataKeys['Education']),
              const EducationWidget(),
              HeaderWidget('Approaches', key: dataKeys['Hard Skills']),
              const ApproachesWidget(),
              const HeaderWidget('Technologies'),
              const TechnologiesWidget(),
              HeaderWidget('Soft Skills', key: dataKeys['Soft Skills']),
              const SoftSkillsWidget(),
              HeaderWidget('Hobbies', key: dataKeys['Hobbies']),
              const HobbiesWidget(),
              HeaderWidget('Contacts', key: dataKeys['Contacts']),
              const ContactsWidget(),
              const BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
