import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/tripplanmodel.dart';
import 'package:travel_app/screen/ongoing%20page/ongoingpage.dart';
import 'package:travel_app/screen/tripdetails/expence.dart';
import 'package:travel_app/screen/tripdetails/tripphotos.dart';

import 'package:travel_app/screen/upcomingpage/upcoming.dart';

class Tripdetails extends StatefulWidget {
  final Plandetails data;
  const Tripdetails(this.data, {super.key});

  @override
  State<Tripdetails> createState() => _TripdetailsState();
}

class _TripdetailsState extends State<Tripdetails>
    with SingleTickerProviderStateMixin {
  int value = 0;

  late TabController tabController;
  int tabnum = 0;
  int indexnum = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String days = 'currentday';
    int daylength =
        dateDifferenceInDays(widget.data.startdate, widget.data.enddate) + 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFCBE7E3),
        title: const Text(
          'Tripdetails ',
          style: TextStyle(color: Color(0xFF05999E)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.data.place,
                              style: const TextStyle(
                                  fontSize: 35,
                                  color: Color(0xFF05999E),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Start Date : ${widget.data.startdate}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text("End Date   : ${widget.data.enddate}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                              "Expected Amount : ${widget.data.expectedamount}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const Text("Companion  :",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemBuilder: (c, index) {
                      DateTime startDate = DateTime.parse(
                          widget.data.startdate.split('-').reversed.join('-'));
                      DateTime today = DateTime.now();
                      int todayIndex =
                          (today.difference(startDate).inDays) % daylength;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            print(todayIndex);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          width: 80,
                          decoration: BoxDecoration(
                              color: todayIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(
                            "Day ${index + 1}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      );
                    },
                    itemCount: daylength,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemBuilder: (c, index) {
                      if (index < 9) {
                        return const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("assets/travel.jpg")
                            // child:Image(image: )
                            );
                      } else if (index == 9) {
                        return TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => const Tripphotos()));
                            },
                            child: const Text(
                              "See all",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ));
                      }
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            TabBar(
                indicatorColor: Colors.white,
                indicatorPadding: EdgeInsets.zero,
                controller: tabController,
                dividerColor: Colors.white,
                tabs: const [
                  Text(
                    'Litery',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Expence',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
            Expanded(
              flex: 1,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      tabnum = value;
                    });
                    tabController.index = value;
                  },
                  itemCount: 2,
                  itemBuilder: (c, i) {
                    if (i == 0) {
                      return const Ongoingpage();
                    } else if (i == 1) {
                      return Expence(
                        expectedamount: widget.data.expectedamount,
                      );
                    }
                    return Container(
                      color: Colors.pink,
                    );
                  }),
            ),
          ],
        ),
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
          MaterialPageRoute(builder: (context) => Upcoming()),
        );
        break;
      case 3:
    }
  }

  int dateDifferenceInDays(String date1Str, String date2Str) {
    final dateFormat = DateFormat('dd-MM-yyyy');

    DateTime date1 = dateFormat.parse(date1Str);
    DateTime date2 = dateFormat.parse(date2Str);

    Duration difference = date2.difference(date1);

    return difference.inDays;
  }
}
