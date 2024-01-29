


import 'package:hive_flutter/adapters.dart';
 part 'expensemodel.g.dart';

 @HiveType(typeId: 3)
 class Expensemodel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String date;
  @HiveField(2)
 String time;
  @HiveField(3)
 String category;
  @HiveField(4)
  String amount;


  Expensemodel({ 
     this.id, 
    required this.date,
    required this.time,
    required this.category,
    required this.amount,
    });
}
