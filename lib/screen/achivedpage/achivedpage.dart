import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/favoritemodel.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/nowtrippage/nowpage.dart';
import 'package:travel_app/screen/tripdetails/tripdetails.dart';
import 'package:travel_app/screen/upcomingpage/upcoming.dart';

//  List<Plandetails>dbtripplan=[];

class Achivedpage extends StatefulWidget {
  const Achivedpage({super.key});

  @override
  State<Achivedpage> createState() => _Achivedpage();
}

List<Plandetails> dbtripplan = [];
List<Plandetails> todayTrips = [];

class _Achivedpage extends State<Achivedpage> {
  List<bool> isExpandedList = [];

  int indexnum = 0;
  final List<Widget> screens = [
     Home(),
    // const Nowpage()
    const Achivedpage()
  ];

  @override
  void initState() {
    // TODO: implement initState

   
    Future.delayed(Duration.zero, () async {
      dbtripplan = await gettripdetails();
      setState(() {
          todayTrips = filterAchivedTrips(dbtripplan);
      });
   
     
      if (todayTrips.isNotEmpty) {
        todayTrips.sort((a, b) => a.startdate.compareTo(b.startdate));

        setState(() {
          isExpandedList = List.generate(todayTrips.length, (index) => false);
        });
      }
    });

  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(children: [
        Expanded(
            child: todayTrips.isEmpty
                ? const Center(
                    child: Text(
                      'No data',
                      style: TextStyle(
                        fontSize: 25,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(1, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final data = todayTrips[index];

                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => Tripdetails(data: data,)));
                          },
                          child: Card(
                            color: const Color(0xFF05999E),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.place,
                                        style: const TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                               addfavoritetodb(data,index);
                                               
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                color:
                                                    dbtripplan[index].favorite
                                                        ? Colors.amber
                                                        : Colors.white,
                                              )),
                                          
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    data.startdate,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  if(isExpandedList.length<index)
                                  if (isExpandedList[index])
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'your destination     :     ${data.place}',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          'Starting Date          :     ${data.startdate}',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          'Ending Date            :     ${data.enddate}',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          'Expected Amount  : ${data.expectedamount}',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  Align(
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isExpandedList[index] =
                                                !isExpandedList[index];
                                          });
                                        },
                                        child: Text(
                                          isExpandedList[index]
                                              ? 'See less..'
                                              : 'See more..',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: todayTrips.length ,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 1,
                        );
                      },
                    ),
                  )),
      ]),
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  Home()),
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Upcoming()),
        );
        break;
      case 3:
    }
  }


    void addfavoritetodb(data, index) async {
    final addfavoriteDb = await Hive.openBox<Favoritemodel>('Dbaddfavorites');

    if (!addfavoriteDb.values.any((element) => element.number == data.number)) {
      final add = Favoritemodel(
         uniqeusername: check[sighnindata].username,
          id: data.id,
          place: data.place,
          startdate: data.startdate,
          enddate: data.enddate,
          expectedamount: data.expectedamount,
          number: data.number);

      await addFavorite(add,check[sighnindata].username);

      setState(() {
        dbtripplan[index].favorite = true;
      });
    } else {
      final datas =
          addfavoriteDb.values.firstWhere((item) => item.number == data.number);

      await deleteFavorite(datas.id!,check[sighnindata].username);

      setState(() {
        dbtripplan[index].favorite = false;
      });
    }
  }
}
