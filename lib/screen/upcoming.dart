import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/companion.dart';
import 'package:travel_app/screen/home.dart';
import 'package:travel_app/screen/upcominglist.dart';



class Upcoming extends StatefulWidget {
 Upcoming({super.key,this.newvalue});
 Plandetails? newvalue;

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  DateTime selectedDate = DateTime.now();
     TextEditingController placecontroller=TextEditingController();
     TextEditingController startdatecontroller=TextEditingController();
     TextEditingController enddatecontroller=TextEditingController();
     TextEditingController expectamountcontroller=TextEditingController();
     final GlobalKey<FormState> validation = GlobalKey<FormState>();

  @override
  void initState() {
  
  if(widget.newvalue!=null){
    placecontroller.text=widget.newvalue!.place;
    startdatecontroller.text=widget.newvalue!.startdate;
    enddatecontroller.text=widget.newvalue!.enddate;
    expectamountcontroller.text=widget.newvalue!.expectedamount;
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming'),
        backgroundColor:const Color(0xFF05999E),
        centerTitle: true, 
      ),
       drawer: const Drawer(
        backgroundColor: Color(0xFF05999E ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/WhatsApp Image 2023-10-30 at 21.46.57_24577aca.jpg"),
              ), 
            ),
            SizedBox(height:10,),
            Text("Jishad.A",style: TextStyle(fontSize: 20),
            ),
            SizedBox(height:10 ,),
            Divider(),
          
            Expanded(child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text("My Account"),
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text("Privacy_Policy"),
                ),
                ListTile(
                  leading: Icon(Icons.library_books),
                  title: Text("Terms&Contitions"),
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text("Favorite"),
                ),
                ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Log Out"),
                ),
              
              ],
            ))
          ],),
        )
        ),
        body: Column(
          children: [
        Container(
          height:MediaQuery.of(context).size.height * 0.2,
            width:MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/travel3.jpg',),fit: BoxFit.cover
                )
            ),
        ),
        Expanded(child: Container(
          height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF05999E),Color(0xFFCBE7E3)
                ],   
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 ),
             
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50,left: 8,right: 8,bottom: 8),
                child: SingleChildScrollView(
                  child: Form(
                  key: validation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center  ,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration:const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(8),
                             child: TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Please Enter Your location ';
                                }
                              },
                              controller: placecontroller,
                              decoration: const InputDecoration(
                                hintText: 'Where to go?',
                                hintStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none 
                              ),
                             ),
                           ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height *0.03 ,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration:const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white
                           
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value){
                              if(value!.isEmpty){
                                return 'Please Add Starting Date';
                              }
                              },
                              onTap: () {
                                 startdate(context);
                              },
                              controller: startdatecontroller,
                              decoration: const InputDecoration(
                                hintText:'Starting Dates',
                               icon: Icon(Icons.calendar_month_rounded),
                                
                             
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 20
                                )
                               
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height *0.03 ,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08 ,
                          decoration:const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please Add Ending Date';
                              }
                            },
                              onTap: () {
                               enddate(context);
                              },
                              controller: enddatecontroller,
                              decoration:  InputDecoration(
                                hintText: 'Ending Dates',
                                icon: GestureDetector( 
                                  onTap: () {
                                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Home()));
                                  },
                                  child:const Icon(Icons.calendar_month_rounded)),
                                hintStyle: const TextStyle(
                                  fontSize: 20
                                ),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height *0.03 ,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.08 ,
                          decoration:const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Please Enter Expected Amount';
                                }
                              },
                              controller:expectamountcontroller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Expected Amount',
                                 
                                icon: Icon(Icons.currency_rupee_sharp),
                                hintStyle: TextStyle(
                                  fontSize: 20
                                ),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                       const SizedBox( height: 20 ,),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Companion()));
                            },
                          child: const SizedBox(
                            
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Invite a tripmate',style: TextStyle(fontSize: 18),),
                                ],
                              ),
                            ),
                        ),
                  
                       SizedBox(height:MediaQuery.of(context).size.height *0.03,),
                        InkWell(
                          splashColor: Colors.amber,
                          onTap: () {
                            if(widget.newvalue!=null){
                              editcheck();
                              gettripdetails();
                            }else{
                             plancheck();
                            gettripdetails();
                            }
                            
                            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Companion()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                          color: Color(0xFF05999E),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                           
                           ),
                                             
                          height: MediaQuery.of(context).size.height *0.05,
                          width: MediaQuery.of(context).size.width *0.5,
                                           
                          child: Center(child: Text(widget.newvalue != null?'Edit':'Start',style:const TextStyle(
                           fontSize: 20
                          ),
                          ),
                          ),
                                 
                                           
                          ),
                        )
                      ],
                      
                    ),
                  ),
                ),
              ),
        ),
        
        
        )
          ],
        ),
    );
  }

   Future<void> startdate(BuildContext context) async {
  
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startdatecontroller.text="${selectedDate.toLocal()}".split(' ')[0];
        // print(startdatecontroller);
         
      });
    }
  }
  
  Future<void> enddate(BuildContext context)async{
   
  
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        enddatecontroller.text="${selectedDate.toLocal()}".split(' ')[0];
        // print(startdatecontroller);
         
      });
    }
  }
    Future <void> plancheck()async{
      final place =placecontroller.text.trim();
      final startingdate=startdatecontroller.text.trim();
      final endingdate=enddatecontroller.text.trim();
      final expectedamount=expectamountcontroller.text.trim();
         if(validation.currentState!.validate()){
          final tripplan=Plandetails(place: place, startdate: startingdate, enddate: endingdate, expectedamount: expectedamount);
          await tripplandetails(tripplan);
         
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Upcominglist()));
      }
    }
  Future<void>editcheck()async{
      final place =placecontroller.text.trim();
      final startingdate=startdatecontroller.text.trim();
      final endingdate=enddatecontroller.text.trim();
      final expectedamount=expectamountcontroller.text.trim();
      if(validation.currentState!.validate()){ 
        final tripplan=Plandetails( id:widget.newvalue!.id , place: place, startdate: startingdate, enddate: endingdate, expectedamount: expectedamount);
           edittripdetails(widget.newvalue!.id,tripplan);
          
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const Upcominglist()));
      }
      
    }
  }
