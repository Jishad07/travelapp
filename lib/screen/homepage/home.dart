import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/screen/achivedpage/achivedpage.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/homepage/drawerstructure.dart';
import 'package:travel_app/screen/nowtrippage/nowpage.dart';
import 'package:travel_app/screen/profile/Profile.dart';
import 'package:travel_app/screen/searchScreen/searchscreen.dart';
import 'package:travel_app/screen/upcominglist/upcominglist.dart';
import 'package:travel_app/screen/upcomingpage/upcoming.dart';

int sighnindata = check.isEmpty ? 0 : check.length - 1;
   List<Loginmodel> data=check;
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController pageController = PageController(initialPage: 1);

  late TabController tabController;
  int tabnum = 0;
  int indexnum = 0;
  @override
  void initState() {
    
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFCBE7E3),
        title: const Text(
          'Home',
          style: TextStyle(color: Color(0xFF05999E)),
        ),
      ),
      drawer: const Drawerscreen(),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                  child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/travel3.jpg'))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                // color: Colors.green,
                child: const Image(
                  image: AssetImage('assets/travel1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
                child: const Image(
                  image: AssetImage('assets/teravel.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                  child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/travel.jpg')))
            ],
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 900),
              viewportFraction: 1,
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Color(0xFF05999E)),
            height: 50,
            child: TabBar(
                indicatorColor: Colors.amber,
                indicatorPadding: EdgeInsets.zero,
                controller: tabController,
                dividerColor: Colors.white,
                tabs: const [
                  Text('Now'),
                  Text('Upcoming'),
                  Text('Achived'),
                ]),
          ),
          Expanded(
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    tabnum = value;
                  });
                  tabController.index = value;
                },
                itemCount: 3,
                itemBuilder: (c, i) {
                  if (i == 0) {
                    return const Nowpage();
                  } else if (i == 1) {
                    return const Upcominglist();
                  }
                  return const Achivedpage();
                }),
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
        break;
      case 1:
      showSearch(context: context, delegate: Search());
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) =>   Search()));
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Profilepage(
                                                                        )));
        break;
    }
  }
}
