import 'package:flutter/material.dart';

class Upcominglist extends StatefulWidget {
  const Upcominglist({super.key});

  @override
  State<Upcominglist> createState() => _UpcominglistState();
}

class _UpcominglistState extends State<Upcominglist> {
   double containerheigt=100;

   void changeheigt(){
    setState(() {
      containerheigt=200;
    });
   }
   void showless(){
    setState(() {
      containerheigt=100;
    });
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text('Upcoming'),
        backgroundColor:const Color(0xFFCBE7E3),
        centerTitle: true, 
      ),
      body:Container(
        decoration:const BoxDecoration(
        gradient:LinearGradient(
          colors: [Color(0xFF05999E),Color(0xFFCBE7E3)],
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter, 
        ),
      ) ,
      child: Column(
        children: [
          Container(
           height: MediaQuery.of(context).size.height *0.3,
           width: double.infinity,
            decoration:const BoxDecoration(
            ),
            child:const Column(mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('If not now',
                style: TextStyle(fontSize: 35),
                ),
                Text('When?',style: TextStyle(fontSize: 35,color: Colors.white),)
              ],
            ),
          ),
         const Divider(color: Colors.black,),
          Expanded(
            child: ListView(
              children:[
              Container(
                height:containerheigt,
                width: double.infinity,
                decoration:const BoxDecoration(
                  color: Colors.amber
                ),
                child: Column(
                  children: [
                    TextButton(onPressed: (){
                      changeheigt();
                    }, child:const Text('showmore')),
                   TextButton(onPressed: (){
                       showless();
                   }, child:Text('showless'))
                  ],
                ),
              )
              ],
            ),
          )
        ],
      ),
     
       ),
       
       );
  }
}