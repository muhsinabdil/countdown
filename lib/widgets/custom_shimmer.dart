import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/app_const.dart';

class CustomShimmer extends StatelessWidget {
  double height;
  double width;
  CustomShimmer({
    Key? key,
    this.height = 100,
    this.width = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: kDefaultBorderRadius),
        height: height,
        width: width,
      ),
    );
  }
}
