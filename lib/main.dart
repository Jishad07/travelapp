import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/expensemodel.dart';
import 'package:travel_app/model/favoritemodel.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/model/tripphotosmodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/splashpage/splash.dart';


Future<void> main()async {
 
 await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(LoginmodelAdapter().typeId)){
     Hive.registerAdapter(LoginmodelAdapter());
     
  
  }
   Hive.registerAdapter(TripphotosmodelAdapter());
    Hive.registerAdapter(PlandetailsAdapter());
    
 await Hive.openBox<Loginmodel>('login_db');
 

  if(!Hive.isAdapterRegistered(ExpensemodelAdapter().typeId)){
    Hive.registerAdapter(ExpensemodelAdapter());
    print('Expensemodeladapter register');
  }
  if(!Hive.isAdapterRegistered(FavoritemodelAdapter().typeId)){
    Hive.registerAdapter(FavoritemodelAdapter());
    print('Favorite adapter register');
  }
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}



