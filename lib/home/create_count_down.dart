import 'package:countdown/constants/app_const.dart';
import 'package:countdown/database/data_model_hive_operation.dart';
import 'package:countdown/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CreateCountDownPage extends StatefulWidget {
  @override
  _CreateCountDownPageState createState() => _CreateCountDownPageState();
}

class _CreateCountDownPageState extends State<CreateCountDownPage> {
  String? itemsString;
  List<DataModel>? itemDBModelList = [];
  DateTime? selectedDate;
  DataModel? dbModel = DataModel();
  final DataModelHiveOperation _dataModelHiveOperation =
      DataModelHiveOperation(); //! database operations

  @override
  void initState() {
    super.initState();
    _dataModelHiveOperation.start();
    _getAll();
  }

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

  void _getAll() {
    var items =
        _dataModelHiveOperation.getItem("27f5c480-beef-1e7d-95e0-97a57afb9036");
    print(items);
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
                      dbModel!.isActive = false;
                      dbModel!.isComplete = false;
                      _dataModelHiveOperation.addOrUpdateItem(dbModel!);
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
