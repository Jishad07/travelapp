import 'package:flutter/material.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/favoritemodel.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/tripdetails/tripdetails.dart';



class Favoritepage extends StatefulWidget {
  const Favoritepage({super.key});

  @override
  State<Favoritepage> createState() => _FavoritepageState();
}

List<Favoritemodel> favoritedata = [];
List<bool> isExpandedList = [];

class _FavoritepageState extends State<Favoritepage> {
  
  @override

  void initState() {
      String userId = check[sighnindata].username; // Implement this according to your authentication system
     getAllFavorites(userId);
    // List favoritedata = addfavoritelist;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF05999E), Color(0xFFCBE7E3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: addfavoritelist.isEmpty
              ? const Center(
                  child: Text(
                  "No Favorite",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      shadows: [Shadow(offset: Offset(2, 2), blurRadius: 3)]),
                ))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final favoritedata = addfavoritelist[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => Tripdetails(data: favoritedata,)));
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
                                    favoritedata.place,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                favoritedata.startdate,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: addfavoritelist.length,
                ),
        ));
  }
}
