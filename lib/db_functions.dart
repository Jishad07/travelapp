




import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/companionmodel.dart';
import 'package:travel_app/model/expensemodel.dart';
import 'package:travel_app/model/favoritemodel.dart';
import 'package:travel_app/model/iterymodel.dart';
import 'package:travel_app/model/tripphotosmodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';


import 'model/model.dart';
 
 List <Loginmodel>user=[];
 List tripplanalldetails=[];
//  List expenselist=[];
 List sortedlist=[];

 List addfavoritelist=[];
 List nowtrip=[];
// List<Expensemodel>sortlist=[];



 
 Future<void> addsignindetails(Loginmodel value,context) async {
  final loginDb = await Hive.openBox<Loginmodel>('login_db');

  // String username = value.username.trim();
  //    bool isUsernameUnique = !loginDb.values.any((element) => element.username == username);

  // if (isUsernameUnique) {

    final _id = await loginDb.add(value); // await for the completion of the add method
    value.id = _id;
    loginDb.put(_id, value);
    check = loginDb.values.toList();
    getdetails();
  // }



}



//get sighnindetails
Future<void>getdetails()async{
     final box=await Hive.openBox<Loginmodel>('login_db');
      check.clear();
      check=  box.values.toList();
     }

  

      

//add tripplan details
Future<int>tripplandetails(Plandetails value)async{
  final tripplandb=await Hive.openBox<Plandetails>('trip_plan_db');
  final _id=await tripplandb.add(value);
  value.id=_id;
  value.number=_id;
  await tripplandb.put(_id, value);
  return _id;
  

}

    //  edit Sughnindatails
Future<void>EditSignindetails(id,editvalue)async{
     final loginDb = await Hive.openBox<Loginmodel>('login_db');
    await loginDb.put(id,editvalue);
   
    getdetails();
}
   



//get tripplan details
Future<List<Plandetails>> gettripdetails()async{
  final box=await Hive.openBox<Plandetails>('trip_plan_db');
  String loggedInUsername = check[sighnindata].username;
    List<Plandetails> filteredTripDetails = box.values.where((trip) {
      
      return trip.uniqeusername == loggedInUsername;

    }).toList();
      // return box.values.toList();
    
      return  filteredTripDetails;
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
   value.id=_id;
   expenseDb.put(_id, value);
  //  expenselist=expenseDb.values.toList();
  return;
 }

 Future<List<Expensemodel>>getExpense(int planid)async{
 
  final box=await Hive.openBox<Expensemodel>('expens_Db');
    return box.values.where((element) => element.tripid==planid).toList();
    //  return box.values.toList();
 }

 Future<int>addtripicture(Tripphotosmodel value)async{
  final addimagesDb=await Hive.openBox<Tripphotosmodel>('addimages_Db');
  final id=await addimagesDb.add(value);
   addimagesDb.put(id, value);
   return id;
  }

  
 Future<List<Tripphotosmodel>>getImages(int planid)async{
 
final box=await Hive.openBox<Tripphotosmodel>('addimages_Db');
    return box.values.where((element) => element.tripid==planid).toList();
    //  return box.values.toList();
 }
// Modify your database function to associate favorites with users
Future<void> addFavorite(Favoritemodel value, String userId) async {
  print('add favorite db okke');
  final addfavoriteDb = await Hive.openBox<Favoritemodel>('Dbaddfavorites');
  final id1 = await addfavoriteDb.add(value);
  value.id = id1;
  value.uniqeusername = userId; // Assign the user ID to the favorite item
  await addfavoriteDb.put(id1, value);
  await getAllFavorites(userId); // Pass userId to fetch user-specific favorites
}

Future<void> deleteFavorite(int id, String userId) async {
  final addfavoriteDb = await Hive.openBox<Favoritemodel>("Dbaddfavorites");
  await addfavoriteDb.delete(id);
  await getAllFavorites(userId); // Pass userId to fetch user-specific favorites
}

Future<void> getAllFavorites(String userId) async {
  final tripplandb=await Hive.openBox<Plandetails>('trip_plan_db');
  // final addfavoriteDb = await Hive.openBox<Favoritemodel>("Dbaddfavorites");
  List<Plandetails> filteredFavorites = tripplandb.values.where((trip) => trip.uniqeusername == userId&&trip.favorite).toList();
  addfavoritelist = filteredFavorites;
}

Future<void>addcompanions(CompanionModel value)async{
  final addcompanionDb=await Hive.openBox<CompanionModel>('companionDb'); 
   final _id=await addcompanionDb.add(value);
  value.id=_id;
  await addcompanionDb.put(_id, value);
  }

  Future<List<CompanionModel>>gettripcompanion(int tripid)async{
    final addcompanionDb=await Hive.openBox<CompanionModel>('companionDb'); 
   final Listitem=await addcompanionDb.values.toList();
   final filterdlist=Listitem.where((element) => element.tripid==tripid).toList();
   return filterdlist;
   

  }


//  Future<void>addfavorites(Favoritemodel value)async{
//   print('add favorite db okke');
//   final addfavoriteDb=await Hive.openBox<Favoritemodel>('Dbaddfavorites');
//  final id1 =await addfavoriteDb.add(value);
//   value.id=id1;
//     await addfavoriteDb.put(id1, value);
//      await getallfavorite();

//   //  return filteredfavorites;
//   }






//  Future<void>deletefavoritedb(int id)async{
//   final addfavoriteDb=await Hive.openBox<Favoritemodel>("Dbaddfavorites");
//     await addfavoriteDb.delete(id);
//    await getallfavorite();

//  }
//   Future<void>getallfavorite()async{
//    final  addfavoriteDb=await Hive.openBox<Favoritemodel>("Dbaddfavorites");
//      String faveritedInUsername = check[sighnindata].username;
//    List<Favoritemodel> filteredfavorites =addfavoriteDb.values.where((trip) => trip.uniqeusername == faveritedInUsername).toList();
//     addfavoritelist.clear();
//     addfavoritelist=filteredfavorites;
//   }

 

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

Future<void>addIteryes(IteryModel value)async{
  final addIteryDb=await Hive.openBox<IteryModel>('itery_Db'); 
   final _id=await addIteryDb.add(value);
  value.id=_id;
  await addIteryDb.put(_id, value);
  }


Future<List<IteryModel>> gettiteryes(int tripid,int day)async{
  final box=await Hive.openBox<IteryModel>('itery_Db');

    List<IteryModel> filteredTripDetails = box.values.where((trip) {
      
      return trip.tripid == tripid && trip.day==day;

    }).toList();
      // return box.values.toList();
    
      return  filteredTripDetails;
    //  dbtripplan.clear();
    //  dbtripplan= box.values.toList();
   }


    Future<void>edititeryes( IteryModel model)async{
    final box=await Hive.openBox<IteryModel>('itery_Db');
       await box.put(model.id,model);
    }

       Future<void>deleteiteryes(int id)async{
        print("tripid=${id}");
        final box=await Hive.openBox<IteryModel>('itery_Db');
        await box.delete(id);
        
  }



