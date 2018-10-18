import 'package:countdown/constants/app_const.dart';
import 'package:countdown/database/data_model_hive_operation.dart';
import 'package:countdown/models/data_model.dart';
import 'package:flutter/material.dart';

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
      DataModelHiveOperation();

  void initDatabase() {
    _dataModelHiveOperation.start();
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

  Future<void> add() async {
    var data = _dataModelHiveOperation!.addOrUpdateItem(
      DataModel(
        title: dbModel!.title,
        date: dbModel!.date,
      ),
    );
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
