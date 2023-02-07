import 'package:flutter/material.dart';
import 'package:flutter_elijah/custom_icons.dart';

final dataKeys = {
  'Home': GlobalKey(),
  'Profile': GlobalKey(),
  'Experience': GlobalKey(),
  'Education': GlobalKey(),
  'Hard Skills': GlobalKey(),
  'Soft Skills': GlobalKey(),
  'Hobbies': GlobalKey(),
  'Contacts': GlobalKey(),
};

const navigationIcons = [
  {'label': 'Home', 'icon': CustomIcons.home, 'selectedIcon': CustomIcons.home},
  {
    'label': 'Profile',
    'icon': CustomIcons.user,
    'selectedIcon': CustomIcons.user
  },
  {
    'label': 'Experience',
    'icon': CustomIcons.shieldAlt,
    'selectedIcon': CustomIcons.shieldAlt
  },
  {
    'label': 'Education',
    'icon': CustomIcons.graduationCap,
    'selectedIcon': CustomIcons.graduationCap
  },
  {
    'label': 'Hard Skills',
    'icon': CustomIcons.cog,
    'selectedIcon': CustomIcons.cog
  },
  {
    'label': 'Soft Skills',
    'icon': CustomIcons.star,
    'selectedIcon': CustomIcons.star
  },
  {
    'label': 'Hobbies',
    'icon': CustomIcons.palette,
    'selectedIcon': CustomIcons.palette
  },
  {
    'label': 'Contacts',
    'icon': CustomIcons.link,
    'selectedIcon': CustomIcons.link
  },
];
