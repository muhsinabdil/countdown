import 'dart:convert';

import 'package:countdown/constants/app_const.dart';
import 'package:countdown/controllers/note_controller.dart';
import 'package:countdown/models/db.dart';
import 'package:countdown/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateCountDownPage extends StatefulWidget {
  @override
  _CreateCountDownPageState createState() => _CreateCountDownPageState();
}

class _CreateCountDownPageState extends State<CreateCountDownPage> {
  String? itemsString;
  List<DB>? itemDBModelList = [];
  DateTime? selectedDate;
  DB? dbModel = DB();
  final NoteController? noteController = NoteController();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dbModel?.date = selectedDate!.toIso8601String();
      setState(() {});
    }
  }

  @override
  void initState() {
    getNoteList();
  }

  Future<void> getNoteList() async {
    itemDBModelList = noteController!.getNotes() as List<DB>?;
    print(itemDBModelList!.length);
  }

  Future<void> addNote(DB note) async {
    noteController!.addNote(note);
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
            ...itemDBModelList!
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
                dbModel!.title = value;

                dbModel!.title = value;
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
            dbModel == null
                ? SizedBox()
                : ElevatedButton(
                    onPressed: () async {
                      addNote(dbModel!);
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
