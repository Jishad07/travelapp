import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'sighninbutton.dart';

  File? image1;
  String? image;

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}
   TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController confirmpasswordcontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController phonenumbercontroller=TextEditingController();
  final GlobalKey<FormState> validation = GlobalKey<FormState>();
  class _SigninState extends State<Signin> {
  // String phoneNumber;
  // String phoneIsoCode;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
         SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:const Image(image: AssetImage('assets/Beach sea ocean coconut.jpeg',),fit: BoxFit.cover,),
          ),
         SingleChildScrollView(
           child: Column(
              children: [
              const  SizedBox(height: 70,),
               Stack(
                 children: [
                   CircleAvatar(
                  backgroundImage: image1 != null? FileImage(image1!):const  AssetImage('assets/travel1.jpg')                                                                                                                                                                                                                                                                                                                               
                  as ImageProvider,
                   radius:55,
               ),
                 Positioned(
                 top: 75,
                 left: 70,
                 child: InkWell(
                  onTap: () {
                    fromgallery();
                  },
                   child:const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 61, 187, 191),
                    radius: 15 , child: Icon(Icons.add_a_photo_outlined,color: Colors.white,size: 16,)
                    ),
                 )
                  )
               ],
               ),
               Form(
                  key: validation,
                  child: Column(
                  children: [
                    Padding(
                          padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  TextFormField(
                  validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter username';
                        }else{
                          return null;
                        }
                  },
                  controller:usernamecontroller,
                   decoration:const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFCBE7E3),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30) )
                      ),
                        hintText: 'Username',
                         ),
                ),
               ), 
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  TextFormField(
                  validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter password';
                        }else{
                          return null;
                        }
                  },
                  controller: passwordcontroller,
                  obscureText: true,
                 decoration:const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFCBE7E3),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30) )
                      ),
                        hintText: 'password',
                         ),
                ),
              ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  TextFormField(
                   validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter confirmpassword';
                        }else{
                          return null;
                        }
                  },
                  controller: confirmpasswordcontroller,
                  obscureText: true,
                 decoration:const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFCBE7E3),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30) )
                      ),
                        hintText: 'confirmpassword',
                         ),
                ),
              ),
                ),
                Padding(
                  
                  padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                  child: Padding(
                padding: const  EdgeInsets.all(8.0),
                child:  TextFormField(
                  validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter email';
                        }
                      if (!_validateEmail(value)) {
                    return 'Invalid email format';
                  }
                  return null;  
                  },
                 controller: emailcontroller,
                 decoration:const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFCBE7E3),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30) )
                      ),
                        hintText: 'Email',
                         ),
                ),
              ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                  child: Padding(
                padding: const EdgeInsets.all(08.0),
                child:  TextFormField(
                  
                  keyboardType: TextInputType.phone,
                  
                  validator: (value){
                    
                        if(value!.isEmpty){
                          return 'Please enter phonenumber';
                        }
                        if(!isValidPhoneNumber(value)){
                          return 'Invalid phone number';
                        }
                         return null;
                  },
                  controller:phonenumbercontroller,
                 decoration:const InputDecoration(
                   filled: true,
                  fillColor: Color(0xFFCBE7E3),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30) )
                      ),
                        hintText: 'Phonenumber',
                         ),
                ),
              ),
                ),
                  ],
                )
                )
                 ,
              const  SizedBox(
                height: 35,
              ),
               const sighninbutton()
              ],
            ),
         )
        ],
      ),
    );
  }
   Future<void> fromgallery() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img1 != null) {
      setState(() {
        image1 = File(img1.path);
        image = image1!.path;
      });
    }
  }
  bool _validateEmail(String email) {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$');
    return emailRegExp.hasMatch(email);
  }
   bool isValidPhoneNumber(String input) {
   final RegExp regex = RegExp(r'^\+?[0-9]+$');
    return regex.hasMatch(input);
  }
}

