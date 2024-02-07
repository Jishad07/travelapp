

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/screen/sighninpage/signin_page.dart';


class Tripphotos extends StatefulWidget {
  const Tripphotos({super.key});

  @override
  State<Tripphotos> createState() => _TripphotosState();
}

class _TripphotosState extends State<Tripphotos> {
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
  itemCount: tripimageslist.length,
  itemBuilder: (context, index) {
    final data = tripimageslist[index];

   
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(data.images)),

          fit: BoxFit.cover, 
        ),
      ),
    );
  },
),
   );
  }

 
}



                        