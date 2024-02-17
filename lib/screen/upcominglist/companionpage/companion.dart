

import 'package:carousel_slider/carousel_slider.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/model/companionmodel.dart';
import 'package:travel_app/screen/upcomingpage/upcoming.dart';

class Companion extends StatefulWidget {
   Companion({Key? key,this.didpressnext}) : super(key: key);
  Function(List<CompanionModel>,String)? didpressnext;
  @override
  State<Companion> createState() => _CompanionState();
}

class _CompanionState extends State<Companion> {

  List<Contact> pickedContactsList = [];
  String type='solo';
  List<String> companions=[];
  TextEditingController namecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companion'),
        backgroundColor: const Color(0xFF05999E),
        centerTitle: true,
      ),
      drawer: const Drawer(
        backgroundColor: Color(0xFF05999E),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/WhatsApp Image 2023-10-30 at 21.46.57_24577aca.jpg"),
                ),
              ),
              SizedBox(height: 10,),
              Text("Jishad.A", style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Divider(),
              Expanded(
                child: Column(
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
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/travel3.jpg',), fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/travel1.jpg',), fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/teravel.jpg',), fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/travel1.jpg',), fit: BoxFit.cover
                    )
                ),
              ),
            ],
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          Expanded(
           
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height*0.9,
                  
                ),
                   
             
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8 , top: 30,right: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person_add_sharp, size: 32,),
                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.03,),
                          const Text('Travel Companions', style: TextStyle(
                              fontSize: 18
                          ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text('Select your travel group type', style: TextStyle(),),
                      ),
                      const SizedBox(),
                      Row(
                        children: [
                          LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              double screenWidth = MediaQuery
                                  .of(context)
                                  .size
                                  .width;
                              double avatarRadius = screenWidth * 0.1;
                              return Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                       setState(() {
                                         type='solo';
                                       });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: type=='solo'?Colors.blue:Colors.white,
                                        radius: avatarRadius,
                                        child: Column(
                                          children: [
                                             Icon(Icons.person, size: 30,color: type=='solo'?Colors.white:Colors.black,),
                                            SizedBox(height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.01),
                                             Text("Solo",style: TextStyle(color:type=='solo'?Colors.white:Colors.black,),)
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.05,),
                                    InkWell(
                                      onTap: () {
                                        // clickcouple(context,);
                                        setState(() {
                                          type='couple';
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: type=='couple'?Colors.blue:Colors.white,
                                        radius: avatarRadius,
                                        child: Column(
                                          children: [
                                            const Icon(Icons.group, size: 30,),
                                            SizedBox(height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.01),
                                            const Text("Couple")
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.05,),
                                    InkWell(
                                      onTap: () {
                                  
                                      setState(() {
                                        type='family';
                                      });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: type=='family'?Colors.blue:Colors.white,
                                        radius: avatarRadius,
                                        child: Column(
                                          children: [
                                            const Icon(Icons.family_restroom, size: 30,),
                                            SizedBox(height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.01),
                                            const Text("Family")
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.05,),
                                    InkWell(
                                      onTap: () {
                                     
                                          setState(() {
                                            type='group';
                                          });
                                      },
                                      child: CircleAvatar(
                                       backgroundColor: type=='group'?Colors.blue:Colors.white,
                                        radius: avatarRadius,
                                        child: Column(
                                          children: [
                                            const Icon(Icons.group_add, size: 30,),
                                            SizedBox(height: MediaQuery
                                                .of(context)
                                                .size
                                                .height * 0.01),
                                            const Text("Group")
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ), 
                    const   SizedBox(height: 24,),
                      if(type!='solo')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(onPressed: (){
                            addcontact();
                             
                          }, child:Text("+ Add your $type")),
                        ],
                      ),
                       if(type!='solo')
                      ListView.builder(itemBuilder: (c,i){
                        return 
                         ListTile(
                          title:  Text(pickedContactsList[i].displayName??""),
                          subtitle:  Text(pickedContactsList[i].phones?.first.value??""),
                          trailing: IconButton(onPressed: (){
                           setState(() {
                             pickedContactsList.removeAt(i);
                           });
                          }, icon:const Icon(Icons.delete)),
                        );
                        

                      },itemCount:pickedContactsList.length,shrinkWrap:true ,)
                     
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {

                  savecompanion();
                 
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
 
 Future<void>addcontact()async{
PermissionStatus permissionStatus=await Permission.contacts.request();
if(permissionStatus.isGranted){

  final Contact=await ContactsService.openDeviceContactPicker();
  if(Contact!=null){
    setState(() {
      pickedContactsList.add(Contact);
    });
  }else{
  
  }
}
 }

void savecompanion(){
  List<CompanionModel>companionlist=[];
for(int i=0;i<pickedContactsList.length;i++){
  
  companionlist.add(CompanionModel(id:null, name:pickedContactsList[i].displayName??"", phonenumber: pickedContactsList[i].phones?.first.value??"",tripid: 0));

}
if(widget.didpressnext!=null){
widget.didpressnext!(companionlist,type);
 Navigator.of(context).pop(MaterialPageRoute(builder: (ctx) => Upcoming()));
}

}
}