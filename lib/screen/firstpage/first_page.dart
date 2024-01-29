
import 'package:flutter/material.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/sighninpage/signin_page.dart';


class First_page extends StatelessWidget {
  
  const First_page({super.key});

  @override
  Widget build(BuildContext context) {
      return  Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
        constraints: const BoxConstraints.expand(),
        child:const Image(image: AssetImage("assets/Beach sea ocean coconut.jpeg"),fit:BoxFit.cover,),
      ),
      Stack(
        children: [
          Positioned(
             top: MediaQuery.of(context).size.height * 0.7,
             left: 0,
            child: Container(
               height: MediaQuery.of(context).size.height * 0.3,
              width:MediaQuery.of(context).size.width,
             
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(100),
                  bottomRight: Radius.circular(100)),
                   color: Color(0xFFCBE7E3),),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                     Navigator. of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const Login()));
                        },
                        child: Container(
                          width: 181,
                          height: 45,
                          decoration:const BoxDecoration(
                             color: Color(0xFF05999E),
                            borderRadius: BorderRadius.all(Radius.circular(45))
                          ),
                          child: const Center(
                            child: Text("LOG IN",
                            textAlign:TextAlign.center ,
                            style: TextStyle(fontSize: 20,color: Colors.white),)),
                         
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height * 0.03,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Signin()));
                      },
                      child: Container(
                          width: 181,
                          height: 45,
                          decoration:const BoxDecoration(
                             color: Color(0xFF05999E),
                            borderRadius: BorderRadius.all(Radius.circular(45))
                          ),
                          child: const Center(
                            child: Text("SIGN IN",
                            textAlign:TextAlign.center ,
                            style: TextStyle(fontSize: 20,color: Colors.white),)),
                      ),
                    )
                    ],
                   ),
            ),
            
          ),
      
          
        ],
      ),
      
        ],
      )
    );
  }
}