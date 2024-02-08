

import 'package:hive_flutter/hive_flutter.dart';
 part 'favoritemodel.g.dart';

@HiveType(typeId:5)
class Favoritemodel{
// bool favorite=true ;
@HiveField(0)
int? id;
@HiveField(1)
String place;
@HiveField(2)
String startdate;
@HiveField(3)
String enddate;
@HiveField(4)
String expectedamount;
@HiveField(5)
int? number;


  Favoritemodel({
    required this.id,
    required this.place,
    required this.startdate,
    required this.enddate,
    required this.expectedamount,
     this.number
   
  });
} 
  


