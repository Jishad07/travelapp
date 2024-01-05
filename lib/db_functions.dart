
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/login_page.dart';
import 'package:travel_app/screen/upcominglist.dart';

import 'model/model.dart';
 
 List user=[];
 List tripplanalldetails=[];

 //sighnin details add to database 
Future<void> addsignindetails(Loginmodel value) async {
  final loginDb = await Hive.openBox<Loginmodel>('login_db');
  final _id = await loginDb.add(value); // await for the completion of the add method
  value.id = _id;
  loginDb.put(_id, value);
  user=loginDb.values.toList();
  getdetails();
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
  tripplandb.put(_id, value);
  tripplanalldetails=tripplandb.values.toList();
}


//get tripplan details
Future<void>gettripdetails()async{
  final box=await Hive.openBox<Plandetails>('trip_plan_db');
     dbtripplan.clear();
     dbtripplan= box.values.toList();
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
      //  editvalue=null;
  }
