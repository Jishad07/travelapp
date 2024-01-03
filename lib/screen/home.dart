


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screen/upcoming.dart';




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
      drawer: const Drawer(
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
        ),
      body:Column(
        children: [
          
          // Container(
          //   height:MediaQuery.of(context).size.height * 0.2,
          //   width:MediaQuery.of(context).size.width,
          //   decoration:const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/travel3.jpg',),fit: BoxFit.cover
          //       )
          //   ),
          // ), 

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
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Upcoming()));
                  },
                   child: CircleAvatar(
                    
                    radius: avatarRadius,
                    backgroundImage:const AssetImage('assets/teravel.jpg'),
                   ),
                 ),
                const  SizedBox(height: 20,),
                CircleAvatar(
                  radius:avatarRadius ,
                  backgroundImage: const AssetImage('assets/travel1.jpg'),
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
            // switch(index){
            //   case 0:
            //   break;

            //   case 1:
             
            //   break;
            //   case 2:
             
            //   break;
            //   case 3:
            //   break;
            //   case 4:
            //   break;
              
              
            // }
          });
        },
        ),
        
    );
  }
}