part of './hive_database_operation.dart'; //! box sı görmesinler diye yaptık diğer classlardan görünürse yapı bozulabilir

///!  her classa gidip key atmak yerine her classın ismini key alıyoruz
///!  bu mixin ile hive modelin gücünü kullanarak key alıyoruz
mixin HiveManagerMixin<T> {
  final String _key = T.toString(); //! sonradan gizledik

//!bu yapılar her operation için bu olacağı için buraya aldık

  late Box<T> _box;
  Future<bool> start() async {
    if (Hive.isBoxOpen(_key)) {
      //! açıksa tekrar açmayacak
      //! mevcut box alınacak
      _box = Hive.box(_key); //! orijinalde bu yok
    } else {
      _box = await Hive.openBox<T>(_key); //! bu key mixin ile oluşuyor
    }

    return true;
  }

  Future<void> clear() async {
    await _box.clear();
  }

  //!
}
