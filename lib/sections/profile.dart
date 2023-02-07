import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: appColors['backGround3'],
      child: Column(
        children: [
          const SizedBox(height: 50),
          const CircleAvatar(
              radius: 74,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              )),
          const SizedBox(height: 30),
          ProfileRowWidget('Name', person.name),
          ProfileRowWidget('Date of Birth', person.dateOfBirth),
          ProfileRowWidget('Position', person.position),
          ProfileRowWidget('City', person.city),
        ],
      ),
    );
  }
}

class ProfileRowWidget extends StatelessWidget {
  final String leftText;
  final String rigthText;
  const ProfileRowWidget(
    this.leftText,
    this.rigthText, {
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                leftText,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 30.0),
              height: 30,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 0.5, color: Colors.white),
                ),
              ),
              child: Text(
                rigthText,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
