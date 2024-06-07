import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';
import 'package:flutter_elijah/widgets/card_widget.dart';

class SoftSkillsWidget extends StatelessWidget {
  const SoftSkillsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10.0, top: 20),
      //height: 220,
      color: appColors['backGround1'],
      child: Wrap(
          children:
              person.softSkills.asMap().entries.map((entry) => IconCardWidget(entry.value, entry.key, 185)).toList()),
    );
  }
}
