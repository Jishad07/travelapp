

import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

 @HiveType(typeId: 1)
 class Loginmodel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String image;
  @HiveField(2)
 String username;
  @HiveField(3)
 String password;
  @HiveField(4)
  String email;
  @HiveField(5)
 String phonenumber;
  Loginmodel({ 
     this.id, 
    required this.image,
    required this.username,
    required this.password,
    required this.email,
    required this.phonenumber});
}
