import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class Person {
  final String name;
  final String position;
  final String dateOfBirth;
  final String city;
  final List<Job> jobs;
  final List<Job> educations;
  final List<String> approaches;
  final List<String> technologies;
  final List<AppIcon> softSkills;
  final List<AppIcon> hobbies;
  final List<AppLink> contacts;

  String stringFromFileName(String fileName) {
    return fileName.substring(0, 1).toUpperCase() +
        fileName.substring(1, fileName.lastIndexOf('.')).replaceAll('_', ' ');
  }

  Person({
    required this.name,
    required this.position,
    required this.dateOfBirth,
    required this.city,
    required this.jobs,
    required this.educations,
    required this.approaches,
    required this.technologies,
    required this.softSkills,
    required this.hobbies,
    required this.contacts,
  });

  factory Person.fromJson(dynamic json) {
    var jobObjsJson = json['jobs'] as List;
    List<Job> _jobs = jobObjsJson.map((jobJson) => Job.fromJson(jobJson, false)).toList();

    var eduObjsJson = json['educations'] as List;
    List<Job> _educations = eduObjsJson.map((eduJson) => Job.fromJson(eduJson, true)).toList();

    var softObjsJson = json['softSkills'] as List;
    List<AppIcon> _softSkills = softObjsJson.map((softSkill) => AppIcon.fromJson(softSkill)).toList();

    var hobObjsJson = json['hobbies'] as List;
    List<AppIcon> _hobbies = hobObjsJson.map((hobbi) => AppIcon.fromJson(hobbi)).toList();

/*
    var conObjsJson = json['contacts'] as List;
    List<AppLink> _contacts =
        conObjsJson.map((contact) => AppLink.fromJson(contact)).toList();
*/
    List<AppLink> _contacts = [];
    _contacts.add(AppLink(
        color: const Color(0xFF0e76a8),
        iconData: FontAwesome5.linkedin,
        link: 'https://www.linkedin.com/in/ilya-aygistov/'));

    _contacts.add(AppLink(
        color: const Color(0xFF0088cc), iconData: FontAwesome5.telegram, link: 'https://telegram.me/Hatnenian'));

    return Person(
      name: json['name'],
      position: json['position'],
      dateOfBirth: json['dateOfBirth'],
      city: json['city'],
      jobs: _jobs,
      educations: _educations,
      approaches: [...json["approaches"]],
      technologies: [...json["technologies"]],
      softSkills: _softSkills,
      hobbies: _hobbies,
      contacts: _contacts,
    );
  }
}

class Job {
  final String companyName;
  final DateTime dateFrom;
  final DateTime dateTo;
  final List<String> positions;
  final List<String> keywords;
  final List<String> responsibilitys;
  final bool isEducation;

  String jobDuration() {
    final monthsCount = (dateTo.year - dateFrom.year) * 12 + dateTo.month - dateFrom.month;
    final years = monthsCount ~/ 12;
    final months = monthsCount % 12;

    return (years > 0 ? years.toString() + ' year' + (years > 1 ? 's ' : ' ') : '') +
        (months > 0 ? months.toString() + ' month' + (months > 1 ? 's' : '') : '');
  }

  String jobPeriod() {
    return ((isEducation ? '' : dateFrom.month.toString() + '.') + dateFrom.year.toString()) +
        (isEducation && dateFrom.year == dateTo.year
            ? ''
            : ' - ' + ((isEducation ? '' : dateTo.month.toString() + '.') + dateTo.year.toString()));
  }

  Job.fromJson(Map<String, dynamic> json, bool _isEducation)
      : companyName = json['companyName'],
        dateFrom = DateTime.parse(json['dateFrom']),
        dateTo = json['dateTo'] != "" ? DateTime.parse(json['dateTo']) : DateTime.now(),
        positions = [...json["positions"]],
        keywords = [...json["keywords"]],
        responsibilitys = [...json["responsibilitys"]],
        isEducation = _isEducation;

  Job({
    required this.companyName,
    required this.dateFrom,
    required this.dateTo,
    required this.positions,
    required this.keywords,
    required this.responsibilitys,
    required this.isEducation,
  });
}

class AppIcon {
  final String name;
  final int iconData;

  AppIcon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        iconData = int.parse(json['iconData']);

  AppIcon({
    required this.name,
    required this.iconData,
  });
}

class AppLink {
  final String link;
  final IconData iconData;
  final Color color;

  AppLink({
    required this.link,
    required this.iconData,
    required this.color,
  });
}

final dateNow = DateTime.now().toString();

String personJson = """{
  "name": "Ilya Aygistov",
  "position": "Flutter & Serverpod Developer",
  "dateOfBirth": "May 29, 1986",
  "city": "Kyiv",
  "jobs": [
    {
      "companyName": "Avtologistika",
      "dateFrom": "2023-04-01",
      "dateTo": "$dateNow",
      "positions": ["Flutter Developer"],
      "keywords": ["Flutter","RxDart","Reactive Forms","Flutter Map","Camera","Sqflite","Open API","Auto Route","SVG","Rest API","gRPC"],
      "responsibilitys": ["Android and iOS app development", "Mentoring and code reviewing","Writing integration tests", "Task estimation"]
    },
    {
      "companyName": "Self-Employed",
      "dateFrom": "2022-01-01",
      "dateTo": "2023-04-01",
      "positions": ["Flutter Developer"],
      "keywords": ["Flutter","Dart","Firebase","BLoC","Provider","Hive"],
      "responsibilitys": ["Web and mobile app development"] 
    },
    {
      "companyName": "StarLightMedia",
      "dateFrom": "2013-02-01",
      "dateTo": "2021-12-01",
      "positions": ["Developer","Senior Developer","Lead Developer"],
      "keywords": ["Advertising","TV","Sales","ERP","CRM"],
      "responsibilitys": ["1C 8.3 development","Users support"] 
    }
  ],
  "educations": [
    {
      "companyName": "National Aviation University",
      "dateFrom": "2005-01-01",
      "dateTo": "2010-01-01",
      "positions": ["Kyiv"],
      "keywords": [],
      "responsibilitys": ["Studied applied mathematics","Programmed on Delphi and С#","Won at the University Mathematics Olympiad 2007"] 
    },
    {
      "companyName": "IT Education Academy",
      "dateFrom": "2017-01-01",
      "dateTo": "2017-03-01",
      "positions": ["Kyiv"],
      "keywords": [],
      "responsibilitys": ["HTML&CSS with JavaScript"] 
    }
  ],
  "approaches": ["waterfall.png", "agile.png", "scrum.png",
     "kanban.png", "lean.png", "TDD.png", "SOLID.png"],
  "technologies": [
    "dart.png",
    "flutter.png",
    "serverpod.png",
    "firebase.png",
    "VS_Code.png",
    "Android_Std.png",
    "ubuntu.png",
    "debian.png",
    "GitHub.png",
    "GitLab.png",
    "docker.png",
    "RxDart.png",    
    "inkscape.png",
    "gimp.png",    
    "sqflite.png",
    "postgres.png",
    "isar.png",
    "hive.png",
    "AutoRoute.png",
    "OpenApi.png",
    "swagger.png",
    "figma.png"],
  "softSkills": [
    {
      "name": "Bringing things to an end",
      "iconData": "0xe801"
    },
    {
      "name": "Teamwork",
      "iconData": "0xf0c0"
    },
    {
      "name": "Time management",
      "iconData": "0xe802"
    },
    {
      "name": "Feedback",
      "iconData": "0xf086"
    },
    {
      "name": "Business letters",
      "iconData": "0xf0e0"
    },
    {
      "name": "Making decisions",
      "iconData": "0xf164"
    },
    {
      "name": "Critical thinking",
      "iconData": "0xf5dc"
    },
    {
      "name": "Creative problem-solving",
      "iconData": "0xf0eb"
    }],
   "hobbies": [
    {
      "name": "Chess",
      "iconData": "0xf439"
    },
    {
      "name": "Cooking",
      "iconData": "0xf563"
    },
    {
      "name": "Ping-pong",
      "iconData": "0xf45d"
    },
    {
      "name": "Reading",
      "iconData": "0xf5da"
    },
    {
      "name": "Picnics",
      "iconData": "0xf1bb"
    },
    {
      "name": "Guitar",
      "iconData": "0xf7a6"
    },
    {
      "name": "Training",
      "iconData": "0xf44b"
    },
    {
      "name": "Walking",
      "iconData": "0xf554"
    }],
    "contacts": [
    {
      "link": "https://www.facebook.com/",
      "iconData": "0xf09a",
      "color": "0xFF3b5998"
    },
    {
      "link": "https://telegram.me/",
      "iconData": "0xf2c6",
      "color": "0xFF0088cc"
    }]    
}""";

var person = Person.fromJson(jsonDecode(personJson));
