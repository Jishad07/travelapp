import 'package:flutter/material.dart';
import 'package:travel_app/screen/sighninpage/functions.dart';

class sighninbutton extends StatelessWidget {
  const sighninbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      signinchecking(context);
  
     },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF05999E),
          borderRadius: BorderRadius.all(Radius.circular(100))
           
        ),
         
        height: 35,
        width: 110,
       child: const Center(child: Text('Sign up',style: TextStyle(
        fontSize: 20
       ),)),
                 
       
      ),
    );
  }
}
