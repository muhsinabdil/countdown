import 'dart:convert';

import 'package:countdown/constants/app_const.dart';
import 'package:countdown/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateCountDownPage extends StatefulWidget {
  @override
  _CreateCountDownPageState createState() => _CreateCountDownPageState();
}

class _CreateCountDownPageState extends State<CreateCountDownPage> {
  String? itemsString;
  List<DataModel>? itemDataModelList = [];
  DateTime? selectedDate;
  DataModel? dataModel = DataModel();

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
        dataModel?.date = selectedDate!.toIso8601String();
      });
    }
  }

  getStringTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    itemsString = prefs.getString('items') ?? '[]';
    if (itemsString != null) {
      final data = await json.decode(itemsString!);
      itemDataModelList =
          data.map((e) => DataModel.fromJson(e)).toList().cast<DataModel>();
    }
//!     prefs.clear();//! temizler
  }

  @override
  void initState() {
    getStringTitle();
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
            ...itemDataModelList!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: kBigBorderRadius,
                            color: Colors.deepPurple),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(e.title!),
                              SizedBox(
                                width: 15,
                              ),
                              Spacer(),
                              Text(e.date!.substring(0, 10)),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
            TextField(
              onChanged: (value) {
                dataModel!.title = value;
              },
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
                itemDataModelList!.add(dataModel!);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String _temp = jsonEncode(itemDataModelList);
                prefs.setString('items', _temp);
                setState(() {});
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
