import 'package:flutter/material.dart';
import 'package:travel_app/screen/upcomingpage/upcoming.dart';

class Starteditbutton extends StatelessWidget {
  const Starteditbutton({
    super.key,
    required this.widget,
  });

  final Upcoming widget;

  @override
  Widget build(BuildContext context) {
    return Container(
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
           
                     
    );
  }
}