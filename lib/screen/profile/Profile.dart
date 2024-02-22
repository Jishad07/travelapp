import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screen/EditProfilePage/editprofilepage.dart.dart';
import 'package:travel_app/screen/firstpage/first_page.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/profile/profile_widget.dart';
import 'package:travel_app/screen/searchScreen/searchscreen.dart';
import 'package:travel_app/screen/upcomingpage/upcoming.dart';


 
class Profilepage extends StatefulWidget {
  const Profilepage({super.key});
 
  @override
  State<Profilepage> createState() => _ProfilepageState();
}


class _ProfilepageState extends State<Profilepage> {
    File? image1;
   String? image;

   TextEditingController editusernamecontroller=TextEditingController();
  TextEditingController editpasswordcontroller=TextEditingController();
  TextEditingController editconfirmpasswordcontroller=TextEditingController();
  TextEditingController editemailcontroller=TextEditingController();
  TextEditingController editphonenumbercontroller=TextEditingController();
  final GlobalKey<FormState> editvalidation = GlobalKey<FormState>();
  @override
  void initState() {
   
    // final data=check;
    editusernamecontroller.text=check[sighnindata].username;
    editpasswordcontroller.text=check[sighnindata].password;
    editemailcontroller.text=check[sighnindata].email;
    editphonenumbercontroller.text=check[sighnindata].phonenumber;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  


    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize=screenWidth/10;
    int indexnum = 0;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height:MediaQuery.of(context).size.height/5
                      ),
                      Expanded(
                          flex: orientation == Orientation.portrait ? 2 : 1,
                          child: Container(
                            // height: MediaQuery.of(context).size.height / 2 + 130  ,
            
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25)),
                                //  color: Color.fromRGBO(255, 193, 7, 1),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height / 10,
                                  ),
                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Text(
                                        "Hi",
                                        style: TextStyle(fontSize: fontSize),
                                      ),
                                      SizedBox(
                                        width: size.height/50 ,
                                      ),
                                      Text(
                                        check[sighnindata].username,
                                        style:  TextStyle(fontSize: fontSize),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      check[sighnindata].email,
                                      style:  TextStyle(fontSize: fontSize/2),
                                    ),
                                  ),
                                   SizedBox(
                                    height: size.height / 100  ,
                                  ),
                                  Center(
                                    child: Text(
                                      check[sighnindata].phonenumber,
                                      style: TextStyle(fontSize:fontSize/2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height / 30,
                                  ),
                                  const Divider(
                                   
                                  ),
                                  SizedBox(
                                    height: size.height / 30,
                                  ),
                  
                                 Expanded(child: SingleChildScrollView(
                                   child: Column(
                                    children: [
                                       Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ProfileWidget(
                                            size: size,
                                            icon: Icons.edit,
                                        
                                            text: 'Edit profile'),
                                        IconButton(
                                            onPressed: () {
                                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const EditProfilPage()));
            
                                            
                                            },
                                            icon: Icon(
                                                Icons.arrow_forward_outlined,size: fontSize/2,))
                                      ],
                                    ),
                                  
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ProfileWidget(
                                            size: size,
                                            icon: Icons.logout,
                                            text: 'LogOut'),
                                            IconButton(
                                            onPressed: () {
                                             logoutbutton();
                                            },
                                            icon:  Icon(
                                                Icons.arrow_forward_outlined,size: fontSize/2,))
                                      ],
                                    )
                                    ],
                                   ),
                                 ))
                                  ,
                                ],
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              );
              },
              
            ),
          ),
          Positioned(
            top: 90,
          left: MediaQuery.of(context).size.width / 2 - 100 / 2 - 20, 
            child: CircleAvatar(
              backgroundImage: FileImage(File(check[sighnindata].image)),
               
              radius: 70,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFF05999E)),
              label: 'Home',
              backgroundColor: Color(0xFFCBE7E3)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Color(0xFF05999E)),
              label: 'Search ',
              backgroundColor: Color(0xFFCBE7E3)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 50,
                color: Color(0xFF05999E),
              ),
              label: 'Add Trip',
              backgroundColor: Color(0xFFCBE7E3)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                color: Color(0xFF05999E),
              ),
              label: 'Map',
              backgroundColor: Color(0xFFCBE7E3)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color(0xFF05999E)),
              label: 'Profile',
              backgroundColor: Color(0xFFCBE7E3)),
        ],
        currentIndex: indexnum,
        onTap: (index) {
          setState(() {
            indexnum = index;
            navigateToScreen(index);
          });
        },
      ),
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
        break;
      case 1:
       showSearch(context: context, delegate: Search());
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Upcoming()),
        );
        break;
      case 3:
        MapsLauncher.launchCoordinates(
                   11.258753, 75.780411, 'Google Headquarters are here');
        break;

      case 4:
    
        break;
    }
  }

 

  void logoutbutton() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('LogOut'),
            content: const Text('Are You Sure'),
            actions: [
              IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: const Text('No')),
              IconButton(onPressed: () {
                logout(context);
              }, icon: const Text('Yes'))
            ],
          );
        });
  }
  Future<void> logout(BuildContext context) async {
  final sharedpref = await SharedPreferences.getInstance();
  sharedpref.clear();
  if(mounted){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const First_page()), (route) => false);
  }

     
}

}



