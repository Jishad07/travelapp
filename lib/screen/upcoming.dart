import 'package:flutter/material.dart';
import 'package:travel_app/screen/companion.dart';



class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

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
                            decoration:const InputDecoration(
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
                            decoration: const InputDecoration(
                              hintText: 'Ending Dates',
                              icon: Icon(Icons.calendar_month_rounded),
                              hintStyle: TextStyle(
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
                            
                          },
                        child:const SizedBox(
                          
                            child:  Row(
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Companion()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                        color: Color(0xFF05999E),
                        borderRadius: BorderRadius.all(Radius.circular(100))
                         
                         ),
                                           
                        height: MediaQuery.of(context).size.height *0.05,
                        width: MediaQuery.of(context).size.width *0.5,
                                         
                        child: const Center(child: Text('Start',style: TextStyle(
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
        
        
        )
          ],
        ),
    );
  }
}