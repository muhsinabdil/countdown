import 'package:flutter/material.dart';

@immutable
class HiveTypes {
  HiveTypes._(); //! HiveTypes._() constructor'ı private yaptık

  static const int userModelId =
      0; //! bu şimdilik kullanılmıyor ilerde kullanılabilirim
  static const int dataModelId = 1;
}
