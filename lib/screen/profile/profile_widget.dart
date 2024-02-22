// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({
    super.key,
    required this.size,
    required this.icon,
    required this.text,
  });
  Size size;
  IconData icon;
  String text;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}
//  TextEditingController editusername=TextEditingController();
 
class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 10;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          widget.icon,
          size: fontSize / 2,
        ),
        SizedBox(
          width: widget.size.width / 10,
        ),
        Text(
          widget.text,
          style: TextStyle(fontSize: fontSize / 3),
        ),
      ],
    );
  }

  // void arrow(String content, String hinttext, context) {
  //   showDialog(
  //       context: context,
  //       builder: (ctx) {
  //         return AlertDialog(
  //           title: Text(content),
  //           // content: Text(content),
  //           actions: [
  //             TextField(
  //               controller: TextEditingController(),
  //               decoration: InputDecoration(hintText: hinttext),
  //             ),
  //             TextButton(
  //                 onPressed: () {},
  //                 child: const Text(
  //                   "Ok",
  //                 ))
  //           ],
  //         );
  //       });
  // }
}
