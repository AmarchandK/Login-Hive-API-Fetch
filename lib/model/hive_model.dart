import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String profession;
  @HiveField(4)
  String mobile;
  @HiveField(5)
  String name;
  UserModel({required this.id, required this.name, required this.password, required this.profession, required this.email,
      required this.mobile});
}
