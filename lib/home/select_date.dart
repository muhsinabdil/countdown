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
      body: ListView.builder(
        itemCount: dataList != null ? 10 : dataList!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: dataList != null
                ? CustomShimmer(
                    height: screenSize.height * 0.1,
                  )
                : Text(
                    dataList![index].title ?? "fds",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
          );
        },
      ),
    );
  }
}
