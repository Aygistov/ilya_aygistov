import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      //margin: const EdgeInsets.only(right: 20.0, bottom: 20),
      //height: 80,
      width: double.infinity,
      color: appColors['backGround1'],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: const Image(
              image: AssetImage('assets/images/icon_flutter.png'),
              height: 20,
            ),
          ),
          Text(
            'Made with Flutter',
            style: Theme.of(context).textTheme.displaySmall!.apply(
                  //fontSizeDelta: 0.1,
                  fontSizeFactor: 0.7,
                ),
          ),
        ],
      ),
    );
  }
}
