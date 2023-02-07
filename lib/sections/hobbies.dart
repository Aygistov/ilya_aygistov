import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';
import 'package:flutter_elijah/widgets/card_widget.dart';

class HobbiesWidget extends StatelessWidget {
  const HobbiesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10.0, top: 20),
      color: appColors['backGround1'],
      child: Wrap(
          children: person.hobbies
              .asMap()
              .entries
              .map((entry) => IconCardWidget(entry.value, entry.key + 2, null))
              .toList()),
    );
  }
}
