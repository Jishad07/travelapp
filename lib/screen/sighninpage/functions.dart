 import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/sighninpage/signin_page.dart';

Future<void> signinchecking(context) async{
    final username=usernamecontroller.text.trim();
    final password=passwordcontroller.text.trim();
    final confirmpassword=confirmpasswordcontroller.text.trim();
    final email=emailcontroller.text.trim();
    final phonenumber=phonenumbercontroller.text.trim();
    if(validation.currentState!.validate()&&image1!=null&&password==confirmpassword){
       final sighnin=Loginmodel(username:username, password: password, email: email, phonenumber: phonenumber, image:'');
       await addsignindetails(sighnin);
       getdetails();
       sighnindata=check.isEmpty?0:check.length-1;
    
      final sharedpref=await SharedPreferences.getInstance();
      sharedpref.setBool(key, true);
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const Home()));
       usernamecontroller.clear();
       passwordcontroller.clear();
       confirmpasswordcontroller.clear();
       emailcontroller.clear();
       phonenumbercontroller.clear();
    }else if(image1==null){

     ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text('Please add picture'),
              duration:  Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              margin: EdgeInsets.only(left: 8,right: 8,bottom: 35),
              )
              );
       
     }else if(password!=confirmpassword){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text('please correct password'),
              duration:  Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              margin: EdgeInsets.only(left: 8,right: 8,bottom: 35),
              )
              );
     }
     
     
  }


  
   