import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';
import 'package:flutter_elijah/sections/experience.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50.0, bottom: 40),
      color: appColors['backGround1'],
      child: Column(
          children: person.educations
              .map((education) => JobWidget(education))
              .toList()),
    );
  }
}
