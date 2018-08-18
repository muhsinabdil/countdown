import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateCountDownPage extends StatefulWidget {
  @override
  _CreateCountDownPageState createState() => _CreateCountDownPageState();
}

class _CreateCountDownPageState extends State<CreateCountDownPage> {
  String? itemsString;
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  getStringTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    itemsString = prefs.getString('items') ?? '[]';
  }

  @override
  void initState() {
    // TODO: implement initState
    getStringTitle();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/db.json');
    final data = await json.decode(response);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Countdown '),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectDate,
              child: Text(selectedDate == null
                  ? 'Select Date'
                  : 'Selected Date: ${selectedDate.toString()}'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('items', 'value');

                Navigator.pop(context);
              },
              child: Text(
                'Save',
              ),
            )
          ],
        ),
      ),
    );
  }
}
