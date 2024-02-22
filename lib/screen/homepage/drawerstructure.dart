import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screen/AboutUs/aboutuspage.dart';
import 'package:travel_app/screen/favoritepage.dart/favoritepage.dart';
import 'package:travel_app/screen/firstpage/first_page.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/privacypolicy/privacypolicy.dart';
import 'package:travel_app/screen/profile/profile.dart';
import 'package:travel_app/screen/terms&contitions/termsandcontitions.dart';

class Drawerscreen extends StatelessWidget {
  const Drawerscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xFF05999E),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(File(check[sighnindata].image)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                check[sighnindata].username,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) =>  Home()));
                    },
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const Profilepage()));
                    },
                    leading: const Icon(Icons.account_circle_outlined),
                    title: const Text("My Account"),
                  ),
                   ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const Favoritepage()));
                    },
                    leading: const Icon(Icons.star_border),
                    title: const Text("Favorite"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const PrivacyPolicy()));
                    },
                    leading: const Icon(Icons.privacy_tip_outlined),
                    title: const Text("Privacy_Policy"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const Termsandcontitions()));
                    },
                    leading: const Icon(Icons.library_books),
                    title: const Text("Terms&Contitions"),
                  ),
                 
                   ListTile(
                    leading: const Icon(Icons.settings_applications),
                    title: const Text('About Me '),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const AboutUsPage()));
                    },
                  ),
                  ListTile(
                    onTap: () {
                      logout(context);
                    },
                    leading: const Icon(Icons.logout_rounded),
                    title: const Text("Log Out"),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

Future<void> logout(BuildContext context) async {
  final sharedpref = await SharedPreferences.getInstance();
  sharedpref.clear();
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>First_page()), (route) => false);
  // Navigator.of(context)
  //     .pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => const First_page()));
}



