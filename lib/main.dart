import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/screen/first_page.dart';


Future<void> main()async {
 
 await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(LoginmodelAdapter().typeId)){
     Hive.registerAdapter(LoginmodelAdapter());
  
  }
 await Hive.openBox<Loginmodel>('login_db');
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
      home: const First_page(),
    );
  }
}



