 import 'package:hive_flutter/hive_flutter.dart';
  part 'companionmodel.g.dart';

@HiveType(typeId: 6)
 class CompanionModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
 String name;
 @HiveField(2)
 String phonenumber;
  @HiveField(3)
 int tripid;

CompanionModel({
  required this.id,
  required this.name,
  required this.phonenumber,
  required this.tripid,
});
  
  
 }