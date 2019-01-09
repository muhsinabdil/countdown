import 'package:countdown/home/create_count_down.dart';
import 'package:countdown/home/my_home_page.dart';
import 'package:countdown/utils/date_return.dart';
import 'package:countdown/widgets/create_float_button.dart';
import 'package:countdown/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

import '../database/data_model_hive_operation.dart';
import '../models/data_model.dart';

class SelectDate extends StatefulWidget {
  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  List<DataModel>? itemDBModelList = <DataModel>[];
  final DataModelHiveOperation _dataModelHiveOperation =
      DataModelHiveOperation(); //! database operations

  initState() {
    super.initState();

    _dataModelHiveOperation.start().then((value) => getAll());
  }

  Future<void> getAll() async {
    itemDBModelList = await _dataModelHiveOperation.getAll();

    if (itemDBModelList!.length <= 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CreateCountDownPage(),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarih Seçiniz"),
      ),
      floatingActionButton: CreateFloatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: itemDBModelList == null ? 10 : itemDBModelList!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: itemDBModelList == null
                ? CustomShimmer(
                    height: screenSize.height * 0.1,
                  )
                : InkWell(
                    onTap: () {
                      itemDBModelList![index].isActive = true;
                      _dataModelHiveOperation
                          .addOrUpdateItem(itemDBModelList![index]);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: screenSize.height * 0.1,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                itemDBModelList![index].title!,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                DateReturnTypes().dateDMYHourStr(DateTime.parse(
                                    itemDBModelList![index].date!)),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CreateCountDownPage(
                                      model: itemDBModelList![index]),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _dataModelHiveOperation
                                    .deleteItem(itemDBModelList![index]);
                                getAll();
                              });
                            },
                            icon: Icon(Icons.delete),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
