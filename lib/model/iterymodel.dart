import 'package:hive_flutter/adapters.dart';
 part 'iterymodel.g.dart';
@HiveType(typeId: 7)
 class IteryModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
 String itery; 
 @HiveField(2)
 int tripid;
 @HiveField(3)
 int day;
 @HiveField(4)
 String time;

 IteryModel({
  required this.id,
  required this.itery,
  required this.tripid,
  required this.day,
  required this.time,
 });
 }