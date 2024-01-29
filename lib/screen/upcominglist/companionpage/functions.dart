import 'package:flutter/material.dart';

void clickcouple(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:const Text('Add Members'),
        content: const Text('Please Add Your Partner'),
        actions: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Partner name'),
          ),
          TextButton(onPressed: () {}, child: const Text('Save'))
        ],
      );
    },
  );
}
  



void clickfamilyandgroup(context,String Title,String content,String hintname) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(

        title: Text(Title),
        content:  Text(content),
        actions: [
          TextFormField(
            
            decoration:  InputDecoration(hintText: hintname,
            ),
          ),
          IconButton(onPressed: (){}, icon:const Icon(Icons.add)),
          TextButton(onPressed: () {}, child: const Text('Save'))
        ],
      );
    },
  );
}
  

   