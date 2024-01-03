
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/screen/login_page.dart';

import 'model/model.dart';
 List user=[];
Future<void> adddetails(Loginmodel value) async {
  final loginDb = await Hive.openBox<Loginmodel>('login_db');
  final _id = await loginDb.add(value); // await for the completion of the add method
   value.id = _id;
    loginDb.put(_id, value);
     user=loginDb.values.toList();
   
}
Future<void>getdetails()async{
     final box=await Hive.openBox<Loginmodel>('login_db');
     check.clear();
     check=box.values.toList();
}


