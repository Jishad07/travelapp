import 'package:flutter/material.dart';
import 'package:travel_app/screen/sighninpage/functions.dart';

class Editbutton extends StatelessWidget {
  const Editbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
     editprofilechecking();
  
     },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF05999E),
          borderRadius: BorderRadius.all(Radius.circular(100))
           
        ),
         
        height: 35,
        width: 110,
       child: const Center(child: Text('Edit',style: TextStyle(
        fontSize: 20
       ),)),
                 
       
      ),
    );
  }
  
  void editprofilechecking() {}

}
