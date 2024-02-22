import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/db_functions.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/screen/homepage/home.dart';
import 'package:travel_app/screen/loginpage/login_page.dart';
import 'package:travel_app/screen/profile/profile.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({super.key});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  File? image1;
  String? image;

  TextEditingController editusernamecontroller = TextEditingController();
  TextEditingController editpasswordcontroller = TextEditingController();
  TextEditingController editconfirmpasswordcontroller = TextEditingController();
  TextEditingController editemailcontroller = TextEditingController();
  TextEditingController editphonenumbercontroller = TextEditingController();
  final GlobalKey<FormState> editvalidation = GlobalKey<FormState>();
  @override
  void initState() {
    // final data = check;
    editusernamecontroller.text = check[sighnindata].username;
    editpasswordcontroller.text = check[sighnindata].password;
    editemailcontroller.text = check[sighnindata].email;
    editphonenumbercontroller.text = check[sighnindata].phonenumber;
              //  final editimage=image1 != null
                      // ? FileImage(image1!)
                      // : FileImage(File(
                          // check[sighnindata].image,
                        // ));
    
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
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
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  fromgallery();
                },
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: image1 != null
                        ? FileImage(image1!)
                        : FileImage(File(
                            check[sighnindata].image,
                          ))
                   
                    ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Form(
              key: editvalidation,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter username';
                      } else {
                        return null;
                      }
                    },
                    controller: editusernamecontroller,
                    // decoration: InputDecoration(hintText: hinttext),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFCBE7E3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      hintText: "UserName",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else {
                        return null;
                      }
                    },
                    controller: editpasswordcontroller,
                    // decoration: InputDecoration(hintText: hinttext1),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFCBE7E3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      } 
                            if (!_validateEmail(value)) {
                    return 'Invalid email format';
                  }
                      else {
                        return null;
                      }
                    },
                    controller: editemailcontroller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFCBE7E3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      hintText: "Email",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Phone number';
                      } 
                  
                      else {
                        return null;
                      }
                    },
                    controller: editphonenumbercontroller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFCBE7E3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      hintText: "Phone Number",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  InkWell(
                    onTap: (){
                      editprofilechecking();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF05999E),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      height: 35,
                      width: 110,
                      child: const Center(
                          child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void editprofilechecking() {
    //final editimage=check[sighnindata].image;
    // final editimage=image;
    final editedusername = editusernamecontroller.text.trim();
    final editedpassword = editpasswordcontroller.text.trim();
    final editedemail = editemailcontroller.text.trim();
    final editedphonenumber = editphonenumbercontroller.text.trim();
    if (editvalidation.currentState!.validate()) { 
      
      final editedsighn = Loginmodel(
          id: check[sighnindata].id,
          // image: image!,
          image:  image==null?check[sighnindata].image:image!,
          username: editedusername,
          password: editedpassword,
          email: editedemail,
          phonenumber: editedphonenumber);
        
         
      EditSignindetails(check[sighnindata].id, editedsighn);
      //   editusernamecontroller.clear();
      //   editpasswordcontroller.clear();
      //  editemailcontroller.clear();
      //  editphonenumbercontroller.clear();

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const Profilepage()));
    }
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
}
