import 'package:flutter/material.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/screen/home.dart';
import '../db_functions.dart';

List<Loginmodel>check=[]; 
 class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
  
class _LoginState extends State<Login> {
  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  final GlobalKey<FormState> validation = GlobalKey<FormState>();
  
@override
   void initState() {
    getdetails();
    gettripdetails();
    super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
        constraints: const BoxConstraints.expand(),
        child:const Image(image: AssetImage("assets/Beach sea ocean coconut.jpeg"),fit:BoxFit.cover,),
      ),
  Padding(
           padding: const EdgeInsets.all(10),
           child: Center(
             child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(76, 10, 10, 10),
              borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height *0.4,
              
      child: Padding(
             padding: const EdgeInsets.only(left: 10,right: 10),
              child: Form(
               key: validation,
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Login',style: TextStyle(color: Colors.white,fontSize: 18 ),),
               const SizedBox(height: 10,),
     Padding(
               padding: const EdgeInsets.all(8.0),
                child:  TextFormField(
                 controller: usernamecontroller,
                   validator: (value){
                      if(value!.isEmpty){
                      return 'Please enter username';
                      }else{
                      return null;
                      }
                          },
                  decoration:const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFCBE7E3),
                  border:OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30) )
                        ),
                          hintText: 'Username',
                         ),
                        ),
                   ),
                      SizedBox(
                         height:MediaQuery.of(context).size.height * 0.03 
                       ),
                         Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  TextFormField(
                                controller: passwordcontroller,
                                validator: (value){
                                    if(value!.isEmpty){
                          return 'Please enter password';
                                }else{
                                  return null;
                                }
                                },
                               decoration: const InputDecoration(
                          filled: true,
                    fillColor: Color(0xFFCBE7E3),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30) )
                        ),
                          hintText: 'Password',
                              ),
                              ),
                         ),
                       SizedBox(height:MediaQuery.of(context).size.height * 0.03),
                         InkWell(
                    onTap: () {
                     logingchecking(context);
                    },
                    child: Container(
                    width:110  ,
                     height: 35 ,
                      decoration: const BoxDecoration(
                        color:Color(0xFF05999E),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      child:const Center(
                        child: Text("Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20 ),)),
                    ),
                         ),
                     ],
                      ),
                 ),
               ),
             ),
           ),
         ),
   ],
      ),
    );
  }
 
  Future<void> logingchecking(context)async{
      final loginusername=usernamecontroller.text.trim();
      final loginpassword=passwordcontroller.text.trim(); 
      if(validation.currentState!.validate()){
      for(int i=0;i<check.length;i++){
        if(check[i].username==loginusername&&check[i].password==loginpassword){
          sighnindata=i;
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const Home()));
         }
         else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:Text('Invalid Username and Password'),
              duration:  Duration(milliseconds:1),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              margin: EdgeInsets.only(left: 8,right: 8,bottom: 35),
              )
              );
        }
         }
         }
         }
         }
