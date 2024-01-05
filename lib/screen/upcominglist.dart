import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/home.dart';
import 'package:travel_app/screen/upcoming.dart';

 List<Plandetails>dbtripplan=[];
 
class Upcominglist extends StatefulWidget {

  const  Upcominglist({super.key});
 
  @override
  State<Upcominglist> createState() => _UpcominglistState();
  }

class _UpcominglistState extends State<Upcominglist> {
  List<bool> isExpandedList = List.generate(dbtripplan.length, (index) => false); 
  int indexnum=0;
   final List <Widget>screens=[
   const  Home(),
   const Upcominglist(),
   
   ];
   double containerheigt=100;
   var cardcolor=Colors.green;
   void changeheigt(){
    setState(() {
      containerheigt=200;
    });
   }
   void showless(){
    setState(() {
      containerheigt=100;
    });
   }
   
  @override
  Widget build(BuildContext context) {
       
    return  Scaffold(
       appBar: AppBar(
        title: const Text('Upcoming'),
        backgroundColor:const Color(0xFFCBE7E3),
        centerTitle: true, 
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
          label: 'Creat',
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
      body:Container(
        decoration:const BoxDecoration(
        gradient:LinearGradient(
          colors: [Color(0xFF05999E),Color(0xFFCBE7E3)],
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter, 
        ),
      ) ,
      child: Column(
        children: [
          Container(
           height: MediaQuery.of(context).size.height *0.3,
           width: double.infinity,
            decoration:const BoxDecoration(
            ),
            child:const Column(mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('If not now',
                style: TextStyle(fontSize: 35),
                ),
                Text('When?',style: TextStyle(fontSize: 35,color: Colors.white),)
              ],
            ),
          ),
         const Divider(color: Colors.black,),
          Expanded(
      child:dbtripplan.isEmpty ?
    const  Center(child:  Text('No data',style: TextStyle(fontSize: 25,shadows: [
                Shadow(
                  color: Colors.white,
                  offset: Offset(1  , 5  ),
                  blurRadius: 10,
                ),
              ],),),):Padding(
              
              padding: const EdgeInsets.all(8.0),
      child: 
       ListView.separated(
        
        itemBuilder: (context, index) {
         final data=dbtripplan[index];
        
          return Card(
           color:
          const Color(0xFF05999E),
      child:  Padding(
       padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
       Text(data.place,style: const TextStyle(fontSize: 25 ,),),
        IconButton(onPressed: (){
         moreButton(context,data);
        
        }, 
        icon:const Icon(Icons.more_vert))
   ],
       ),
        SizedBox(height: MediaQuery.of(context).size.height *0.01 ,),
         Text(data.startdate,style: const TextStyle(fontSize: 16 ),),
          if(isExpandedList[index]
            )  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      [
        Text( 'your destination     :     ${data.place }',
        style:const TextStyle(fontSize: 20),),
        SizedBox(height: MediaQuery.of(context).size. height *0.02,),
        Text('Starting Date          :     ${data.startdate}',style: const TextStyle(fontSize: 20),),
        SizedBox(height: MediaQuery.of(context).size. height *0.02,),
        Text( 'Ending Date            :     ${data.enddate }',style:const  TextStyle(fontSize: 20),),
        SizedBox(height: MediaQuery.of(context).size. height *0.02,), 
        Text('Expected Amount  :     ${data.expectedamount}',style: const TextStyle(fontSize: 20),),
      ],
       ),
                                  
          Align(
        child: GestureDetector(
                onTap: () {
                 setState(() {
                  isExpandedList[index] = !isExpandedList[index];
                  }); 
                 },
      child: Text(
              isExpandedList[index] ? 'See less..' : 'See more..',
               style:const TextStyle(color: Colors.white
               ),)
               ),
               )
             ], 
              ),
              ),
             );
               },
                itemCount: dbtripplan.length ,
                  separatorBuilder: (context, index) {
                    return const  Divider(height: 1,);
                },
                  ),
                 )
            ),
        ]
          ),
      ),
    );
  }
 void moreButton(BuildContext context,data) async {
  String? selectedOption = await showMenu<String>(
   color: const Color(0xFF05999e),
  elevation:8,
   
    context: context,
      position:RelativeRect.fill,
    items: <PopupMenuEntry<String>>[
       PopupMenuItem<String>(
        value: 'Option 1',
        child: Row(
          children: [
            IconButton(onPressed: (){
              setState(() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Upcoming(newvalue: data,)));
                // edittripdetails(id,newvalue);
              });
            }, icon:const Icon(Icons.edit)),
          const  Text('Edit',style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
       PopupMenuItem<String>(
        value: 'Option 2',
        child: Row(
          children: [ 
            IconButton(onPressed: (){
              showDialog(
                context: context, 
                builder: (context){
                  return   AlertDialog(
                    title:const Text('Are you sure delete this file?'),
                    content:const  Text("If you delete the file you can't recover it"),
                    actions: [TextButton(onPressed: (){
                      setState(() {
                   deletetripdetails(data.id);
              });
              Navigator.of(context).pop();
                    }, child:const Text('yes')),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child:const Text('Cancel'))
                    // ElevatedButton(onPressed: (){}, child:const  Text('Cancel'))
                    ],
                  );
                });
                 
             }, icon:const Icon(Icons.delete)),
           const Text('Delete'),
          ],
        ),
      ),
      
     
    ],
  );

  if (selectedOption != null) {
   
  }
}
void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        break;
      case 1:
       
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  Upcoming()),
        );
        break;
       case 3:

    }
  }

   void tripdetailscard(){
  
  
   }
   
   
}


