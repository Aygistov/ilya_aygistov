import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';

class HeaderWidget extends StatelessWidget {
  final String headerText;
  const HeaderWidget(
    this.headerText, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: appColors['header'],
      child: Center(
          child: Text(
        headerText,
        style: Theme.of(context).textTheme.displayMedium,
      )),
    );
  }
}
