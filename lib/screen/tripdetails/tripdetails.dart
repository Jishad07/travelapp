// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/companionmodel.dart';
import 'package:travel_app/model/tripphotosmodel.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/tripdetails/expence.dart';
import 'package:travel_app/screen/tripdetails/iterypage.dart';
import 'package:travel_app/screen/tripdetails/tripphotos.dart';


import 'package:travel_app/screen/upcomingpage/upcoming.dart';

   
 

class Tripdetails extends StatefulWidget {
   var data;
   var filteredData;
   
  Tripdetails( {
    super.key,
    required this.data,
    this.filteredData,});
   
  @override
  State<Tripdetails> createState() => _TripdetailsState();
}

class _TripdetailsState extends State<Tripdetails>
    with SingleTickerProviderStateMixin {
  List<Tripphotosmodel>imagelist=[];
  int selectedday=0;
  int value = 0;
 List<Contact> pickedContactsList = [];
  late TabController tabController;
  int tabnum = 0;
  int indexnum = 0;
   void gettripimages()async{
  List<Tripphotosmodel> newList= await getImages(widget.data.id!);
   setState(() {
     imagelist=newList;
   });
   }
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    getcompanion();
    gettripimages();

  
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
  
    super.dispose();
  }

  List<CompanionModel>companionlist=[];
   void getcompanion()async{
   List<CompanionModel>tripcompanios = await gettripcompanion(widget.data.id);
  
   setState(() {
     companionlist=tripcompanios;
  
   });
   }
  @override
  Widget build(BuildContext context) {
    // String days = 'currentday';
    int daylength =
        dateDifferenceInDays(widget.data.startdate, widget.data.enddate) + 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFCBE7E3),
        title: const Text(
          'Tripdetails ',
          style: TextStyle(color: Color(0xFF05999E)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  widget.data.place,
                                  style: const TextStyle(
                                      fontSize: 35,
                                      color: Color(0xFF05999E),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "Start Date : ${widget.data.startdate}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text("End Date   : ${widget.data.enddate}",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  "Expected Amount : ${widget.data.expectedamount}",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                                    
                                Row(
                                  children: [
                                   const Text("Companion  :",style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                                      TextButton(onPressed: (){
                                        contactbottomsheet();
                                      }, child:Text(widget.data.triptype??"Solo"))
                                  ],
                                )
                              //  Text("Companion  :    ${widget.data.triptype??"Solo"}",
                              //     style:const  TextStyle(
                              //         fontSize: 16, fontWeight: FontWeight.bold))
                            ],
                          ),  
                        ),
                      ),
                    ],
                  ),
                ),
                // horizodal scroll
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                        itemBuilder: (c, index) {
                          DateTime startDate = DateTime.parse(
                              widget.data.startdate.split('-').reversed.join('-'));
                          DateTime today = DateTime.now();
                          int todayIndex =
                              (today.difference(startDate).inDays) % daylength;
                
                          return InkWell(
                            onTap: () {
                              setState(() {
                               selectedday=index;
                              });
                              // pagecontroller.
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: 80,
                              decoration: BoxDecoration(
                                  color: selectedday == index
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                  child: Text(
                                "Day ${index + 1}",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          );
                        },
                        itemCount: daylength,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              
                  
              // Add  image 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          
                          Expanded(
                            child: ListView.builder(
                              
                              itemBuilder: (ctx, index) {
                          
                              
                              


                                  
                                  return  Row(
                                    children: [


                                      if(index==0)
                                      InkWell(
                          onTap: () {
                         
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {

                              return  GalleryAlert(tripid: widget.data.id,callback: (){
                                  gettripimages();
                              },);
                            }));
                           
                          },
                           child: const  CircleAvatar(
                            
                                     radius: 50, 
                                     backgroundColor: Colors.white54,
                                     child: Padding(
                                       padding: EdgeInsets.only(left: 5,top: 5),
                                       child: Text("Add Images",style: TextStyle(fontSize: 12 ),),
                                     ),
                                    ),
                         ),

                            if (index-1 > 0 && index - 1 < imagelist.length)
                              CircleAvatar(
                                          radius: 50,
                                          backgroundImage:  FileImage(File(imagelist[index-1].images??""))
                                         
                                          ),

                                             if(index == imagelist.length)
                                          TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (ctx) =>  Tripphotos(tripid: widget.data.id,)));
                                      },
                                      child: const Text(
                                        "See all",
                                        style:
                                            TextStyle(color: Colors.blue, fontSize: 18),
                                      )
                                      )
                                       

                                    ],
                                  );
                              },
                              itemCount:imagelist.length+1,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      )),
                ),
                
                
                
                
                 TabBar(
                    indicatorColor: Colors.white,
                    indicatorPadding: EdgeInsets.zero,
                    controller: tabController,
                    dividerColor: Colors.white,
                    tabs: const [
                      Text(
                        'Itery',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Expence',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ]),
                  
                  
                    // page view builder
              Container(
                  // flex: 1,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height/2,
                    // minHeight: 100,
                  ),
                  child: PageView.builder(
                  
                    // controller: pagecontroller,
                    key: Key("$selectedday"),
                  
                      onPageChanged: (value) {
                        setState(() {
                          tabnum = value;
                        });
                        tabController.index = value;
                      },
                      itemCount: 2,
                      itemBuilder: (c, i) {
                        if (i == 0) {
                          return  IteryPage(plandetails: widget.data,day: selectedday,);
                        } else if (i == 1) {
                          return Expence(
                          plandetailsdata: widget.data,
                          );
                        }
                        return Container(
                          color: Colors.pink,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Upcoming()),
        );
        break;
      case 3:
    }
  }

  int dateDifferenceInDays(String date1Str, String date2Str) {
    final dateFormat = DateFormat('dd-MM-yyyy');

    DateTime date1 = dateFormat.parse(date1Str);
    DateTime date2 = dateFormat.parse(date2Str);

    Duration difference = date2.difference(date1);

    return difference.inDays;
  }


    void contactbottomsheet(){
   showModalBottomSheet(
    context: context, builder: (BuildContext context){
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration:const BoxDecoration(
        color: Colors.white
        ),
        child: ListView.builder(
          itemBuilder: (context,index){
        return  Column(
          children: [
            if(index==0)
             Container(
              width: double.infinity,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                   Expanded(child: Text("Trip Members",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                    IconButton(onPressed: (){
                      addcontact();
                    }, icon:const Icon(Icons.add)),
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon:const Icon(Icons.close))
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(companionlist[index].name),
              subtitle: Text(companionlist[index].phonenumber),
              trailing: IconButton(onPressed: (){}, icon:Icon(Icons.delete)),
            ),
          ],
        );
        },
        itemCount: companionlist.length,
        )
      );
    });
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


    }
class GalleryAlert extends StatefulWidget {
  int tripid;
  Function? callback;
   GalleryAlert({super.key,required this.tripid,this.callback});

  @override
  State<GalleryAlert> createState() => _GalleryAlertState();
}

class _GalleryAlertState extends State<GalleryAlert> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        content: const Text("Choose"),
        actions: [
          TextButton(onPressed: (){
            fromcamera();
             Navigator.of(context).pop();
          }, child:const Text("Camera")),
          TextButton(onPressed: ()async{
           await fromgallery();
            Navigator.of(context).pop();
            if(widget.callback!=null){
                widget.callback!();
            }
            
            
          }, child:const Text("Gallery"))
        ],
      );
  }
    Future <void>fromcamera()async{
       File? image1;
       String? image;
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);
    if(img1!=null){
      setState(() {
        image1=File(img1.path);
        image=image1!.path;
        
      });
    }
  }

    Future<void> fromgallery() async {
       File? image1;
       String? image;
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img1 != null) {
      print("image!=null");
     
        image1 = File(img1.path);
        image = image1!.path;
     
     final value= Tripphotosmodel(images:image!,tripid: widget.tripid);
      await addtripicture(value);
      return;
       print("image added");
    }
     return;
  }



}