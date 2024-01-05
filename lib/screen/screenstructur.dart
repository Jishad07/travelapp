import 'package:flutter/material.dart';
import 'package:travel_app/screen/home.dart';
import 'package:travel_app/screen/login_page.dart';

class drawerscreen extends StatelessWidget {
  const drawerscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(           
      backgroundColor:const Color(0xFF05999E ),
      child: Padding(
        padding:const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/WhatsApp Image 2023-10-30 at 21.46.57_24577aca.jpg"),
            ), 
          ),
         const SizedBox(height:10,),
          Text(check[sighnindata].username,style: const TextStyle(fontSize: 20),
          ),
         const  SizedBox(height:10 ,),
         const Divider(),
        
           Expanded(child: Column(
            children: [
              ListTile(
                leading:const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Home()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("My Account"),
              ),
             const ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy_Policy"),
              ),
              const ListTile(
                leading: Icon(Icons.library_books),
                title: Text("Terms&Contitions"),
              ),
            const   ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text("Favorite"),
              ),
            const  ListTile(
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