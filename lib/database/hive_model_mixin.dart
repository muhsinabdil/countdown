///!  her classa gidip key atmak yerine her classın ismini key alıyoruz
///!  bu mixin ile hive modelin gücünü kullanarak key alıyoruz

mixin HiveModelMixin<T> {
  final String key = T.toString();
}
