import 'package:flutter/material.dart';

import '../constants/app_const.dart';
import '../home/create_count_down.dart';

class CreateFloatButton extends StatelessWidget {
  const CreateFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateCountDownPage(),
                fullscreenDialog: true));
      },
    );
  }
}
