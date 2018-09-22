import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:countdown/constants/app_const.dart';
import 'package:countdown/home/create_count_down.dart';
import 'package:countdown/models/motivation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MotivationModel? motivationModel;
  late List<MotivationModel>? motivationModelList;

  initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/tr.json');
    final data = await json.decode(response);
    setState(() {
      motivationModelList = data
          .map((e) => MotivationModel.fromJson(e))
          .toList()
          .cast<MotivationModel>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final birthday = DateTime(2028, 02, 09);
    final date2 = DateTime.now();
    final difference = birthday.difference(date2);

    int year = difference.inDays ~/ 365;
    year++; //! because we are not counting the current year
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {});
    });

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateCountDownPage(),
              ));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.2,
                child: Center(
                  child: Text(
                    "MyCountdown",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  CircularPercentIndicator(
                    radius: screenSize.width * 0.25,
                    lineWidth: screenSize.width * 0.05,
                    percent: days / (365 * year),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${days}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.blue)),
                        Text(
                          "Days",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                    progressColor: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularPercentIndicator(
                    radius: screenSize.width * 0.13,
                    lineWidth: 10.0,
                    percent: hours / 24,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${hours}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.green)),
                        Text(
                          "Hours",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                    progressColor: Colors.green,
                  ),
                  CircularPercentIndicator(
                    radius: screenSize.width * 0.13,
                    lineWidth: 10.0,
                    percent: minutes / 60.0,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${minutes}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.orange)),
                        Text(
                          "Minutes",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                    progressColor: Colors.orange,
                  ),
                  CircularPercentIndicator(
                    radius: screenSize.width * 0.13,
                    lineWidth: screenSize.width * 0.03,
                    percent: seconds / 60,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${seconds}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.red)),
                        Text(
                          "Seconds",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                    progressColor: Colors.red,
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.05),
              Center(
                child: Column(
                  children: [
                    Text(
                      "\"${motivationModelList?[days % 49].text ?? 'Loading...'}\"",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Text(motivationModelList?[days % 49].author ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
