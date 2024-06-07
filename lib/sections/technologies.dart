import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';
import 'package:flutter_elijah/widgets/card_widget.dart';

class TechnologiesWidget extends StatelessWidget {
  const TechnologiesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10.0, top: 20),
      color: appColors['backGround1'],
      child: Wrap(children: person.technologies.map((technology) => CardWidget(technology, 'technologies')).toList()),
    );
  }
}
