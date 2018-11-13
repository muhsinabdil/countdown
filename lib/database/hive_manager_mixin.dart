part of './hive_database_operation.dart'; //! box sı görmesinler diye yaptık diğer classlardan görünürse yapı bozulabilir

///!  her classa gidip key atmak yerine her classın ismini key alıyoruz
///!  bu mixin ile hive modelin gücünü kullanarak key alıyoruz
mixin HiveManagerMixin<T> {
  final String _key = T.toString(); //! sonradan gizledik

//!bu yapılar her operation için bu olacağı için buraya aldık

  late Box<T> _box;
  Future<void> start() async {
    if (Hive.isBoxOpen(_key)) return; //! açıksa tekrar açmayacak
    _box = await Hive.openBox<T>(_key); //! bu key mixin ile oluşuyor
  }

  Future<void> stop() async {
    await _box.close();
  }

  Future<void> clear() async {
    await _box.clear();
  }
  //!
}
