import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: appColors['backGround1'],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              person.name,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Text(
            person.position,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
