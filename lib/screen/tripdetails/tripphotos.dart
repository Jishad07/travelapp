

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Tripphotos extends StatefulWidget {
  const Tripphotos({super.key});

  @override
  State<Tripphotos> createState() => _TripphotosState();
}

class _TripphotosState extends State<Tripphotos> {
  @override
  Widget build(BuildContext context) {            
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Container(
            height: 500,  
            width: double.infinity,
            color: Colors.amber,
          
          ),
          TextButton(onPressed: (){ 
           addimage();
          }, child:Text("Add images"))
        ],
        
      ),
    );
  }

  Future<void>addimage()async{
    final ImagePicker picker=ImagePicker();
    XFile? pickedimage=await picker.pickImage(source: ImageSource.gallery);
    if(pickedimage!=null){
     setState(() {
      //  _image = File(pickedImage.path);
     }); 
    }
  }
}



                        