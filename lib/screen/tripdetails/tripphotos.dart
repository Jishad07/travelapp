

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/tripphotosmodel.dart';
import 'package:travel_app/screen/sighninpage/signin_page.dart';


class Tripphotos extends StatefulWidget {
  int tripid;
   Tripphotos({super.key,required this.tripid});

  @override
  State<Tripphotos> createState() => _TripphotosState();
}

class _TripphotosState extends State<Tripphotos> {
   
   List<Tripphotosmodel>imagelist=[];
     void gettripimages()async{
  List<Tripphotosmodel> newList= await getImages(widget.tripid);
   setState(() {
     imagelist=newList;
     print("imagelist length==${imagelist.length}");
   });
   }

   @override
  void initState() {
    // TODO: implement initState
    gettripimages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {            
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
        centerTitle: true,

      ),
      body:GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 2,
    crossAxisSpacing: 2,
  ),
  itemCount: imagelist.length,
  itemBuilder: (context, index) {
    final data = imagelist[index];

   
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(data.images??"")),

          fit: BoxFit.cover, 
        ),
      ),
    );
  },
),
   );
  }

 
}



                        