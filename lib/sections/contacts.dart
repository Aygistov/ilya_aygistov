import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: appColors['backGround1'],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            person.contacts.map((contact) => LinkIconButton(contact)).toList(),
      ),
    );
  }
}

class LinkIconButton extends StatelessWidget {
  final AppLink applink;

  const LinkIconButton(
    this.applink, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: IconButton(
        icon: Icon(applink.iconData),
        iconSize: 50,
        color: applink.color,
        tooltip: applink.link,
        onPressed: () {
          openLink(applink.link);
        },
      ),
    );
  }
}

void openLink(String link) async {
  if (await canLaunchUrlString(link)) {
    await launchUrlString(link);
  } else {
    throw 'Could not launch $link';
  }
}
