import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
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
     );
  }
}
