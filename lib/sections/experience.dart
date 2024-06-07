import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';
import 'package:flutter_elijah/person_data.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50.0, bottom: 40),
      color: appColors['backGround1'],
      child: Column(children: person.jobs.map((job) => JobWidget(job)).toList()),
    );
  }
}

class JobWidget extends StatelessWidget {
  final Job job;
  const JobWidget(
    this.job, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(children: [
        SizedBox(
          width: double.infinity,
          child: Wrap(
            children: [
              Baseline(
                baseline: 15,
                baselineType: TextBaseline.ideographic,
                child: Text(
                  job.companyName,
                  style: Theme.of(context).textTheme.displaySmall!.apply(color: appColors['header']),
                  //textAlign: TextAlign.right,
                ),
              ),
              ...job.positions.asMap().entries.map((entry) => PositionWidget(entry.value, entry.key))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5),
          width: double.infinity,
          child: Text(
            '${job.jobPeriod()} | ${job.jobDuration()}',
            style: Theme.of(context).textTheme.headlineMedium!.apply(color: appColors['header']),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
              alignment: WrapAlignment.start,
              children: job.keywords.map((keyword) => KeywordsWidget(keyword)).toList()),
        ),
        Column(children: job.responsibilitys.map((responsibility) => ResponsibilityWidget(responsibility)).toList()),
      ]),
    );
  }
}

class PositionWidget extends StatelessWidget {
  final String position;
  final int index;
  const PositionWidget(
    this.position,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      ' | $position',
      style: Theme.of(context).textTheme.headlineMedium!.apply(color: appColors['header']),
    );
  }
}

class KeywordsWidget extends StatelessWidget {
  final String keyword;
  const KeywordsWidget(
    this.keyword, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 5, bottom: 3),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: appColors['header']!),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        keyword,
        style: Theme.of(context).textTheme.titleLarge!.apply(color: appColors['header']),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class ResponsibilityWidget extends StatelessWidget {
  final String responsibility;
  const ResponsibilityWidget(
    this.responsibility, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      width: double.infinity,
      child: Text(
        '> $responsibility',
        style: Theme.of(context).textTheme.headlineMedium!.apply(color: appColors['header']),
        textAlign: TextAlign.left,
      ),
    );
  }
}
