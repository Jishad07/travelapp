

import 'package:hive_flutter/hive_flutter.dart';

 part 'tripphotosmodel.g.dart';
  @HiveType(typeId: 4)
class Tripphotosmodel{
  @HiveField(0)
  String? images;
  @HiveField(1)
  int tripid;
  Tripphotosmodel({
     this.images,
     required this.tripid});
}