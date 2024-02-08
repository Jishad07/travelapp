import 'package:hive_flutter/hive_flutter.dart';
part 'tripplanmodel.g.dart';

@HiveType(typeId: 2)
class Plandetails{
 bool favorite=false;
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


//  @HiveField(5)
  // DateTime date; 
  
// @HiveField(5)
// bool favorite;

Plandetails({
  
  this.id,
  required this.place,
  required this.startdate,
  required this. enddate,
  required this.expectedamount,
 this.number
  //  this.date
  // this.favorite=false
});
  

}
