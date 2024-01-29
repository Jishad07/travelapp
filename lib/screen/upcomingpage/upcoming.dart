// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:travel_app/db_functions.dart';
// import 'package:travel_app/model/tripplanmodel.dart';
// import 'package:travel_app/screen/upcominglist/companionpage/companion.dart';
// import 'package:travel_app/screen/homepage/home.dart';
// import 'package:travel_app/screen/upcomingpage/starteditbutton.dart';

// import 'drawer.dart';


// @immutable
// class Upcoming extends StatefulWidget {
//  Upcoming({super.key,this.newvalue});
//  Plandetails? newvalue;
 
//   @override
//   State<Upcoming> createState() => _UpcomingState();
// }
//      TextEditingController placecontroller=TextEditingController();
//      TextEditingController startdatecontroller=TextEditingController();
//      TextEditingController enddatecontroller=TextEditingController();
//      TextEditingController expectamountcontroller=TextEditingController();
//      final GlobalKey<FormState> validation = GlobalKey<FormState>();
//       final GlobalKey<FormState> editvalidation = GlobalKey<FormState>();

// class _UpcomingState extends State<Upcoming> {
//   DateTime selectedDate = DateTime.now();
    
//   @override
//   void initState() {
  
//   if(widget.newvalue!=null){
//     placecontroller.text=widget.newvalue!.place;
//     startdatecontroller.text=widget.newvalue!.startdate;
//     enddatecontroller.text=widget.newvalue!.enddate;
//     expectamountcontroller.text=widget.newvalue!.expectedamount;
//   }
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: const Text('Upcoming'),
//         backgroundColor:const Color(0xFF05999E),
//         centerTitle: true, 
//       ),
//        drawer:const drawer(),
//         body: Column(
//           children: [
//         Container(
//           height:MediaQuery.of(context).size.height * 0.2,
//             width:MediaQuery.of(context).size.width,
//             decoration:const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/travel3.jpg',),fit: BoxFit.cover
//                 )
//             ),
//         ),
//         Expanded(child: Container(
//           height: MediaQuery.of(context).size.height,
//               width:  MediaQuery.of(context).size.width,
//               decoration:const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF05999E),Color(0xFFCBE7E3)
//                 ],   
//                  begin: Alignment.topCenter,
//                  end: Alignment.bottomCenter,
//                  ),
//              ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 50,left: 8,right: 8,bottom: 8),
//                 child: SingleChildScrollView(
//                   child: Form(
//                   key: widget.newvalue!=null?editvalidation:validation,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center  ,
//                       children: [
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.08,
//                           decoration:const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(18)),
//                             color: Colors.white
//                            ),
//                            child: Padding(
//                              padding: const EdgeInsets.all(8),
//                              child: TextFormField(
//                               validator: (value){
//                                 if(value!.isEmpty){
//                                   return 'Please Enter Your location ';
//                                 }else{
//                                   return null;
//                                 }
//                               },
//                               controller: placecontroller,
//                               decoration: const InputDecoration(
//                                 hintText: 'Where to go?',
//                                 hintStyle: TextStyle(fontSize: 20),
//                                 border: InputBorder.none 
//                               ),
//                              ),
//                            ),
//                         ),
//                         SizedBox(height:MediaQuery.of(context).size.height *0.03 ,),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.08,
//                           decoration:const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(18)),
//                             color: Colors.white
                           
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               validator: (value){
//                               if(value!.isEmpty){
//                                 return 'Please Add Starting Date';
//                               }else{
//                                 return null;
//                               }
//                               },
//                               onTap: () {
//                                  startdate(context);
//                               },
//                               controller: startdatecontroller,
//                               decoration: const InputDecoration(
//                                 hintText:'Starting Dates',
//                                icon: Icon(Icons.calendar_month_rounded),
                                
                             
//                                 border: InputBorder.none,
//                                 hintStyle: TextStyle(
//                                   fontSize: 20
//                                 )
                               
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height:MediaQuery.of(context).size.height *0.03 ,),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.08 ,
//                           decoration:const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(18)),
//                             color: Colors.white
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                             validator: (value) {
//                               if(value!.isEmpty){
//                                 return 'Please Add Ending Date';
//                               }else{
//                                 return null;
//                               }
//                             },
//                               onTap: () {
//                                enddate(context);
//                               },
//                               controller: enddatecontroller,
//                               decoration:  InputDecoration(
//                                 hintText: 'Ending Dates',
//                                 icon: GestureDetector( 
//                                   onTap: () {
//                                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Home()));
//                                   },
//                                   child:const Icon(Icons.calendar_month_rounded)),
//                                 hintStyle: const TextStyle(
//                                   fontSize: 20
//                                 ),
//                                 border: InputBorder.none
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height:MediaQuery.of(context).size.height *0.03 ,),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.08 ,
//                           decoration:const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(18)),
//                             color: Colors.white
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               validator: (value) {
//                                 if(value!.isEmpty){
//                                   return 'Please Enter Expected Amount';
//                                 }else{
//                                   return null;
//                                 }
//                               },
//                               controller:expectamountcontroller,
//                               keyboardType: TextInputType.number,
//                               decoration: const InputDecoration(
//                                 hintText: 'Expected Amount',
                                 
//                                 icon: Icon(Icons.currency_rupee_sharp),
//                                 hintStyle: TextStyle(
//                                   fontSize: 20
//                                 ),
//                                 border: InputBorder.none
//                               ),
//                             ),
//                           ),
//                         ),
//                        const SizedBox( height: 20 ,),
//                         InkWell(
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const  Companion()));
//                             },
//                           child: const SizedBox(
//                             child: Row(
//                                 children: [
//                                   Icon(Icons.add),
//                                   Text('Invite a tripmate',style: TextStyle(fontSize: 18),),
//                                 ],
//                               ),
//                             ),
//                         ),
//                    SizedBox(height:MediaQuery.of(context).size.height *0.03,),
//                       GestureDetector(
//                           onTap: () {
//                             if(widget.newvalue!=null){
//                               editcheck();
//                               gettripdetails();
//                             }else{
//                              plancheck();
//                             gettripdetails();
//                             }
//                           },
//                           child: Starteditbutton(widget: widget),
//                         )
//                       ],
//                       ),
//                   ),
//                 ),
//               ),
//               ),
//         )
//           ],
//         ),
//     );
//   }

//    Future<void> startdate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//         startdatecontroller.text= dateFormat(selectedDate);
//     });
//     }
//     }
  
//   Future<void> enddate(BuildContext context)async{
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         enddatecontroller.text=dateFormat(selectedDate); 
//          }
//          );
//     }
//   }
//     Future <void> plancheck()async{
//       final place =placecontroller.text.trim();
//       final startingdate=startdatecontroller.text.trim();
//       final endingdate=enddatecontroller.text.trim();
//       final expectedamount=expectamountcontroller.text.trim();
//          if(validation.currentState!.validate()){
//           final tripplan=Plandetails(place: place, startdate: startingdate, enddate: endingdate, expectedamount: expectedamount);
//           await tripplandetails(tripplan);
//           if(mounted){
//             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Home()));
//           }
         
//       }
//     }
//   Future<void>editcheck()async{
//       final place =placecontroller.text.trim();
//       final startingdate=startdatecontroller.text.trim();
//       final endingdate=enddatecontroller.text.trim();
//       final expectedamount=expectamountcontroller.text.trim();
//       if(editvalidation.currentState!.validate()){ 
//         final tripplan=Plandetails( id:widget.newvalue!.id , place: place, startdate: startingdate, enddate: endingdate, expectedamount: expectedamount);
      
//            edittripdetails(widget.newvalue!.id,tripplan);
           
//              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Home()));
          
//         placecontroller.clear();
//         startdatecontroller.clear();
//         enddatecontroller.clear();
//         expectamountcontroller.clear();

//       }
//       }
//        String dateFormat (DateTime date) {
//     return DateFormat('dd-MM-yyyy').format(date);
//   }
//     }



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/upcominglist/companionpage/companion.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/upcomingpage/starteditbutton.dart';



class GlobalKeyManager {
  GlobalKey<FormState> validation = GlobalKey<FormState>();
  GlobalKey<FormState> editValidation = GlobalKey<FormState>();
}

class Upcoming extends StatefulWidget {
  Upcoming({Key? key, this.newvalue}) : super(key: key);
  final Plandetails? newvalue;

  @override
  State<Upcoming> createState() => _UpcomingState();
}

TextEditingController placecontroller = TextEditingController();
TextEditingController startdatecontroller = TextEditingController();
TextEditingController enddatecontroller = TextEditingController();
TextEditingController expectamountcontroller = TextEditingController();

class _UpcomingState extends State<Upcoming> {
  DateTime selectedstartingDate = DateTime.now();
  DateTime selectedendingDate = DateTime.now();
  GlobalKeyManager globalKeyManager = GlobalKeyManager();

  @override
  void initState() {
    if (widget.newvalue != null) {
      placecontroller.text = widget.newvalue!.place;
      startdatecontroller.text = widget.newvalue!.startdate;
      enddatecontroller.text = widget.newvalue!.enddate;
      expectamountcontroller.text = widget.newvalue!.expectedamount;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming'),
        backgroundColor: const Color(0xFF05999E),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/travel3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF05999E),
                    Color(0xFFCBE7E3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 8, right: 8, bottom: 8),
                child: SingleChildScrollView(
                  child: Form(
                    key: widget.newvalue != null
                        ? globalKeyManager.editValidation
                        : globalKeyManager.validation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your location ';
                                } else {
                                  return null;
                                }
                              },
                              controller: placecontroller,
                              decoration: const InputDecoration(
                                  hintText: 'Where to go?',
                                  hintStyle: TextStyle(fontSize: 20),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Add Starting Date';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                startdate(context);
                              },
                              controller: startdatecontroller,
                              decoration: const InputDecoration(
                                hintText: 'Starting Dates',
                                icon: Icon(Icons.calendar_month_rounded),
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Add Ending Date';
                                } else {
                                  return null;
                                }
                              },
                              onTap: () {
                                enddate(context);
                              },
                              controller: enddatecontroller,
                              decoration: InputDecoration(
                                hintText: 'Ending Dates',
                                icon: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => const Home()));
                                    },
                                    child:
                                        const Icon(Icons.calendar_month_rounded)),
                                hintStyle: const TextStyle(fontSize: 20),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Expected Amount';
                                } else {
                                  return null;
                                }
                              },
                              controller: expectamountcontroller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: 'Expected Amount',
                                  icon: Icon(Icons.currency_rupee_sharp),
                                  hintStyle: TextStyle(fontSize: 20),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => const Companion()));
                          },
                          child: const SizedBox(
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                Text(
                                  'Invite a tripmate',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        GestureDetector(
                          onTap: () {
                            if (widget.newvalue != null) {
                              editCheck();
                              getTripDetails();
                            } else {
                              planCheck();
                              getTripDetails();
                            } 
                          },
                          child: Starteditbutton(widget: widget),
                        )
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

  Future<void>startdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedstartingDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
       selectedstartingDate  = picked;
        startdatecontroller.text = dateFormat(selectedstartingDate );
      });
    }
  }

  Future<void>enddate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:selectedendingDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null&&!picked.isBefore(selectedstartingDate)) {
     
        setState(() {
        selectedendingDate= picked;
        enddatecontroller.text = dateFormat(selectedendingDate);
      });
     
    }
  }

  Future<void>planCheck() async {
    final place = placecontroller.text.trim();
    final startingdate = startdatecontroller.text.trim();
    final endingdate = enddatecontroller.text.trim();
    final expectedamount = expectamountcontroller.text.trim();
    if (globalKeyManager.validation.currentState!.validate()) {
      final tripplan = Plandetails(
          place: place,
          startdate: startingdate,
          enddate: endingdate,
          expectedamount: expectedamount);
      await tripplandetails(tripplan);
      if (mounted) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Home()));
      }
    }
  }

  Future<void>editCheck() async {
    final place = placecontroller.text.trim();
    final startingdate = startdatecontroller.text.trim();
    final endingdate = enddatecontroller.text.trim();
    final expectedamount = expectamountcontroller.text.trim();
    if (globalKeyManager.editValidation.currentState!.validate()) {
      final tripplan = Plandetails(
          id: widget.newvalue!.id,
          place: place,
          startdate: startingdate,
          enddate: endingdate,
          expectedamount: expectedamount);

      edittripdetails(widget.newvalue!.id, tripplan);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Home()));

      placecontroller.clear();
      startdatecontroller.clear();
      enddatecontroller.clear();
      expectamountcontroller.clear();
    }
  }

  String dateFormat(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  Future<void> getTripDetails() async {
    // Implement your logic to get trip details from the database
  }
}
