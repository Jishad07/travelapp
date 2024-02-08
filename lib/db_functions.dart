


import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/expensemodel.dart';
import 'package:travel_app/model/favoritemodel.dart';
import 'package:travel_app/model/tripphotosmodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';

import 'model/model.dart';
 
 List <Loginmodel>user=[];
 List tripplanalldetails=[];
 List expenselist=[];
 List sortedlist=[];
 List tripimageslist=[];
 List addfavoritelist=[];
 List nowtrip=[];
// List<Expensemodel>sortlist=[];
 //sighnin details add to database 
Future<void> addsignindetails(Loginmodel value) async {
  final loginDb = await Hive.openBox<Loginmodel>('login_db');
  final _id = await loginDb.add(value); // await for the completion of the add method
  value.id = _id;
  loginDb.put(_id, value);
  user=loginDb.values.toList();
  getdetails();
  print(user[0].username);
}

//get sighnindetails
Future<void>getdetails()async{
     final box=await Hive.openBox<Loginmodel>('login_db');
     check.clear();
     check=box.values.toList();
     }

//add tripplan details
Future<void>tripplandetails(Plandetails value)async{
  final tripplandb=await Hive.openBox<Plandetails>('trip_plan_db');
  final _id=await tripplandb.add(value);
  value.id=_id;
  value.number=_id;
  await tripplandb.put(_id, value);
  print('mujeeb');
  

}
   



//get tripplan details
Future<List<Plandetails>>gettripdetails()async{
  final box=await Hive.openBox<Plandetails>('trip_plan_db');
   return box.values.toList();
    //  dbtripplan.clear();
    //  dbtripplan= box.values.toList();
   }


//delete tripplan details
    Future<void>deletetripdetails(int id)async{
    final box=await Hive.openBox<Plandetails>('trip_plan_db');
     await box.delete(id);
      gettripdetails();
  }

  //edit tripplan details
  Future<void>edittripdetails(id,editvalue)async{
    final box=await Hive.openBox<Plandetails>('trip_plan_db');
       await box.put(id,editvalue);

       gettripdetails();
     
  }
  // add members to db
  // Future <void>addmembers()async{
  //   final membersdb=await Hive.openBox<Plandetails>('membersdb');
  //   final members=await membersdb.add();
  // }

 Future<void>addexpense(Expensemodel value)async{
  final expenseDb=await Hive.openBox<Expensemodel>('expens_Db');
  final _id= await expenseDb.add(value);
   final id=_id;
   expenseDb.put(_id, value);
   expenselist=expenseDb.values.toList();
   print(expenseDb.values);
   getExpense();
 }

 Future<List<Expensemodel>>getExpense()async{
  final box=await Hive.openBox<Expensemodel>('expens_Db');
  return box.values.toList();
 }

 Future<void>addtripicture(Tripphotosmodel value)async{
  final addimagesDb=await Hive.openBox<Tripphotosmodel>('addimages_Db');
  final id=await addimagesDb.add(value);
  addimagesDb.put(id, value);
  tripimageslist.clear();
  tripimageslist=addimagesDb.values.toList();
  print(tripimageslist[0]);
 }

 Future<void>addfavorites(Favoritemodel value)async{
  print('add favorite db okke');
  final addfavoriteDb=await Hive.openBox<Favoritemodel>('Dbaddfavorites');
  final id1 =await addfavoriteDb.add(value);
  value.id=id1;
  await addfavoriteDb.put(id1, value);
   await getallfavorite();
    
 }






 Future<void>deletefavoritedb(int id)async{
  final addfavoriteDb=await Hive.openBox<Favoritemodel>("Dbaddfavorites");
    await addfavoriteDb.delete(id);
   await getallfavorite();

 }
  Future<void>getallfavorite()async{
   final  addfavoriteDb=await Hive.openBox<Favoritemodel>("Dbaddfavorites");
    addfavoritelist.clear();
    addfavoritelist=addfavoriteDb.values.toList();
  }

 

    bool isToday(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final inputDate = DateTime(date.year, date.month, date.day);
  
  return inputDate.isAtSameMomentAs(today);
}




List<Plandetails> filterTodayTrips(List<Plandetails> trips) {
   DateTime now = DateTime.now();
  String nowdate = DateFormat('dd-MM-yyyy').format(now);

  List<Plandetails> todayTrips = trips.where((trip) {
    DateTime tripStartDate = DateFormat('dd-MM-yyyy').parse(trip.startdate);
    DateTime tripEndDate = DateFormat('dd-MM-yyyy').parse(trip.enddate);
    DateTime nowDate = DateFormat('dd-MM-yyyy').parse(nowdate);
    return tripStartDate.isBefore(nowDate.add(const Duration(days: 1))) &&tripEndDate.isAfter(nowDate);
  }).toList();

  // 
  return todayTrips;
}

List<Plandetails> filterAchivedTrips(List<Plandetails> trips) {
  DateTime now = DateTime.now();
  String nowdate = DateFormat('dd-MM-yyyy').format(now);

  List<Plandetails> todayTrips = trips.where((trip) {
    DateTime tripEndDate = DateFormat('dd-MM-yyyy').parse(trip.enddate);
    DateTime nowDate = DateFormat('dd-MM-yyyy').parse(nowdate);
    return tripEndDate.isBefore(nowDate);
  }).toList();

  return todayTrips;
}

List<Plandetails> filterTripsUpcomings(List<Plandetails> trips) {
 DateTime now = DateTime.now();
  String nowdate = DateFormat('dd-MM-yyyy').format(now);

  List<Plandetails> todayTrips = trips.where((trip) {
    DateTime tripStartDate = DateFormat('dd-MM-yyyy').parse(trip.startdate);
    DateTime nowDate = DateFormat('dd-MM-yyyy').parse(nowdate);
    return tripStartDate.isAfter(nowDate);
  }).toList();

  return todayTrips;
}



