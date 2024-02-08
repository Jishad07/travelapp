import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          
            gradient: LinearGradient(
                colors: [Color(0xFF05999E), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left :8,bottom: 20,right: 8),
          
          child: ListView(
            children: const [
              Text(
                'Welcome To Ready To Go',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "\nWelcome to 'Ready To Go Travel App,' where we bring your adventures to life! We are committed to offering you the finest travel experiences, with a focus on seamless planning, personalized itineraries, and unforgettable memories.\n\n Established in 2023 by Hijas Ahamed, Ready To Go Travel App marks our inaugural venture into the realm of travel technology. Our mission is to revolutionize the way you explore the world, starting with a comprehensive travel hub that lays the groundwork for future enhancements./n/nReady To Go Travel App delivers unparalleled travel experiences that exceed your expectations. From captivating user interfaces to streamlined functionalities, we ensure every aspect of your journey is a breeze.\n\nExpect top-notch quality and enhanced features that empower you to customize your travel preferences and discover new destinations effortlessly.\n\nWe're dedicated to ensuring your travel experiences are nothing short of exceptional. Should you have any inquiries or feedback, please don't hesitate to reach out to us.\n\n",
                 
        
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
        
                textAlign: TextAlign.start,
              ),
              Text(" Happy travels!",style: TextStyle(fontSize: 20),),
              SizedBox(height: 5,),
              Text(" Sincerely,",style: TextStyle(fontSize: 20),),
              SizedBox(height: 5,),
              Text("Jishad",style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
