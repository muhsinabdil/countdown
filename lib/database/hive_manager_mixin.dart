import 'package:hive_flutter/hive_flutter.dart';

///!  her classa gidip key atmak yerine her classın ismini key alıyoruz
///!  bu mixin ile hive modelin gücünü kullanarak key alıyoruz

mixin HiveManagerMixin<T> {
  final String _key = T.toString(); //! sonradan gizledik

//!bu yapı her operation için bu olacağı için buraya aldık
  late Box<T> box;
  Future<void> start() async {
    box = await Hive.openBox<T>(_key); //! bu key mixin ile oluşuyor 
  }

  //!
}
