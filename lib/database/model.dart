import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class MyDatabase {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  MyDatabase(this.name, this.age);
}
