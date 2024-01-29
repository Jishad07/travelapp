import 'package:flutter/material.dart';

class Ongoingpage extends StatelessWidget {
  const Ongoingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF05999E),Color(0xFFCBE7E3)],
            begin:Alignment.topCenter,
            end: Alignment.bottomCenter )
            
        ),
      ),
    );
  }
}