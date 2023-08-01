import 'package:countdown/home/create_count_down.dart';
import 'package:countdown/utils/date_return.dart';
import 'package:countdown/widgets/create_float_button.dart';
import 'package:countdown/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';

class SelectDate extends StatelessWidget {
  final List<DataModel>? dataList;

  const SelectDate({Key? key, required this.dataList}) : super(key: key);
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
        itemCount: dataList == null ? 10 : dataList!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: dataList == null
                ? CustomShimmer(
                    height: screenSize.height * 0.1,
                  )
                : InkWell(
                    onTap: () {
                      Navigator.of(context).pop(index);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: screenSize.height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              dataList![index].title!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Spacer(),
                            Text(
                              DateReturnTypes().dateDMYHourStr(
                                  DateTime.parse(dataList![index].date!)),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CreateCountDownPage(
                                        model: dataList![index]),
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
