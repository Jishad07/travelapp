import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/login_page.dart';
import 'package:travel_app/screen/screenstructur.dart';
import 'package:travel_app/screen/upcoming.dart';
import 'package:travel_app/screen/upcominglist.dart';

int sighnindata=check.length-1;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

  class _HomeState extends State<Home> {
  int indexnum=0;
  @override
  Widget build(BuildContext context) {
  
    return  Scaffold(
        appBar: AppBar(
        centerTitle: true,
        backgroundColor:const  Color(0xFFCBE7E3),
        title: const Text('Home',style: TextStyle(
          color: Color(0xFF05999E)
        ),
        ),
        ),
      drawer: const drawerscreen(),
      body:Column(
        children: [
          CarouselSlider(
          items: [
            SizedBox(
              height:MediaQuery.of(context).size.height * 0.2,
              width:MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: const Image(fit:BoxFit.cover,
                image: AssetImage('assets/travel3.jpg'))
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height * 0.2,
              width:MediaQuery.of(context).size.width,
              // color: Colors.green,
              child:const Image(image: AssetImage('assets/travel1.jpg'),fit: BoxFit.cover ,),
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height * 0.2,
              width:MediaQuery.of(context).size.width,
              // color: Colors.blue,
              child:const Image(image: AssetImage('assets/teravel.jpg'),fit: BoxFit.cover,),
            ),
             SizedBox(
              height:MediaQuery.of(context).size.height * 0.2,
              width:MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: const Image(fit:BoxFit.cover,
                image: AssetImage('assets/travel.jpg')))
          ],
          options: CarouselOptions(
            height: 200.0,
             enlargeCenterPage: true,
            
             autoPlay:true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 900),
            viewportFraction: 1,
          ),
        ),
     Expanded(
           child:Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF05999E),Color(0xFFCBE7E3)
                ],   
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 ),
             ),
             child: SingleChildScrollView(
               child:LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
               double screenWidth = MediaQuery.of(context).size.width;
               double avatarRadius = screenWidth * 0.2;
               return  Padding(
               padding: const EdgeInsets.only(top: 18,left: 10),
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,       
                children: [
                const Text('Travel Details', 
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 18),
                  ),
                const  SizedBox(height: 20,),
                 InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Upcominglist()));
                  },
                   child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage:const AssetImage('assets/teravel.jpg'),
                   ),
                 ),
                const  SizedBox(height: 20,),
                InkWell(
                  onTap: () {

                  },
                  child: CircleAvatar(
                    radius:avatarRadius ,
                    backgroundImage: const AssetImage('assets/travel1.jpg'),
                   ),
                ),
                const  SizedBox(height: 20,),
                  CircleAvatar(
                  radius:avatarRadius,
                  backgroundImage: const AssetImage('assets/travel2.jpg'),
                 ) 
                ],
               ),
                 );
                }
                )
             ),
            ), 
          )
          ],
      ),
  bottomNavigationBar: BottomNavigationBar(
        items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Color(0xFF05999E)),
          label: 'Home',
          backgroundColor: Color(0xFFCBE7E3)),

          BottomNavigationBarItem(
          icon: Icon(Icons.search,color: Color(0xFF05999E)),
          label: 'Search ',
          backgroundColor: Color(0xFFCBE7E3)),

           BottomNavigationBarItem(
          icon: Icon(Icons.add_box,size: 50,color: Color(0xFF05999E ),),
          label: 'Home',
          backgroundColor: Color(0xFFCBE7E3)),

           BottomNavigationBarItem(
          icon: Icon(Icons.calculate,color: Color(0xFF05999E),),
          label: 'Calculator',
          backgroundColor: Color(0xFFCBE7E3)),

           BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Color(0xFF05999E)),
          label: 'Profile',
          
          backgroundColor: Color(0xFFCBE7E3)), 
        ],
        currentIndex:indexnum,
        onTap: (index) {
          setState(() {
            indexnum=index;
            navigateToScreen(index);
         });
        },
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
          MaterialPageRoute(builder: (context) =>  Upcoming()),
        );
        break;
       case 3:

    }
  }
}

