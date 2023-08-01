import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:countdown/constants/app_const.dart';
import 'package:countdown/database/data_model_hive_operation.dart';
import 'package:countdown/home/my_home_page.dart';
import 'package:countdown/models/data_model.dart';

class CreateCountDownPage extends StatefulWidget {
  DataModel? model;

  CreateCountDownPage({
    Key? key,
    this.model,
  }) : super(key: key);
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

    if (widget.model != null) {
      dbModel = widget.model;
      selectedDate = DateTime.parse(dbModel!.date!);
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 100)),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dbModel?.date = selectedDate!.toIso8601String();
      setState(() {});
    }
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
                  : '${selectedDate.toString()}'),
            ),
            SizedBox(height: 16.0),
            dbModel == null
                ? SizedBox()
                : ElevatedButton(
                    onPressed: () async {
                      dbModel!.isActive = false;
                      dbModel!.isComplete = false;
                      _dataModelHiveOperation.addOrUpdateItem(dbModel!);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                        (route) => false,
                      );
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
