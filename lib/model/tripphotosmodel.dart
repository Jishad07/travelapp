

import 'package:hive_flutter/hive_flutter.dart';

 part 'tripphotosmodel.g.dart';
  @HiveType(typeId: 4)
class Tripphotosmodel{
  @HiveField(0)
  String? images;
  Tripphotosmodel({ this.images});
}