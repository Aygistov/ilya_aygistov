import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';

class CardWidget extends StatelessWidget {
  final String folder;
  final String approache;
  const CardWidget(
    this.approache,
    this.folder, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10, top: 10),
      margin: const EdgeInsets.only(right: 20.0, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        height: 125,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$folder/${approache.toLowerCase()}',
              //width: 75,
            ),
            Text(
              person.stringFromFileName(approache),
              style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class IconCardWidget extends StatelessWidget {
  final AppIcon appIcon;
  final int index;
  final double? cardHeight;
  const IconCardWidget(
    this.appIcon,
    this.index,
    this.cardHeight, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5, top: 10),
      margin: const EdgeInsets.only(right: 20.0, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        //height: 165,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 105,
              width: 100,
              child: Icon(
                //CustomIcons.book_reader,
                IconData(appIcon.iconData, fontFamily: 'CustomIcons'),
                color: iconColors[index % iconColors.length],
                size: 80.0,
              ),
            ),
            Text(
              appIcon.name,
              style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
