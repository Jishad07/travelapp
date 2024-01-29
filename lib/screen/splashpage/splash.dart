import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screen/firstpage/first_page.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';

import '../../db_functions.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    
   splashchecking();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }

  Future<void>splashchecking()async{
     getdetails();
    final share= await SharedPreferences.getInstance();
      final loginvalue=share.getBool(key);
    if(loginvalue==null||loginvalue==false ){
      await Future.delayed(const Duration(seconds: 5));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const First_page()));
    }
    else{
      await Future.delayed(const Duration(seconds: 5));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const Home()));
    }
  }
}