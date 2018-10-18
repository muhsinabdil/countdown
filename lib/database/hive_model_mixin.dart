///! data modele item eklemek için.
/// Bu mixin model classına mixin olarak eklenmelidir.
mixin HiveModelMixin {
  String get key;
  int get id;
  set id(int value);
}
