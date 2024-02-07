

import 'package:flutter/material.dart';
class Termsandcontitions extends StatelessWidget {
  const Termsandcontitions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms&Contitions",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors:[Color(0xFF05999E),Colors.white],
          begin:Alignment.topCenter,
          end: Alignment.bottomCenter)
          
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 8),
          child: ListView(
            children: [
                Center(child: buildTextStyle("Terms and Conditions for Travel App", fontSize: 20 ,isHeading: true)),
          
             const SizedBox(height: 25 ,),  
             buildTextStyle("1. Acceptance of Terms:",fontSize: 18,isHeading: true),
             buildTextStyle("By accessing or using the [Your App Name] travel app (the 'App'), you agree to comply with and be bound by these Terms and Conditions.",fontSize: 16),
            const  SizedBox(height: 20,),
             buildTextStyle("2. User Eligibility:",fontSize: 18,isHeading: true),
             buildTextStyle("Users must be at least 18 years old to use the App.\nUsers are responsible for providing accurate and complete information during the registration process.",fontSize: 16),
              const  SizedBox(height: 20,),
             buildTextStyle("3. Account Security:",fontSize: 18,isHeading: true),
             buildTextStyle("Users are responsible for maintaining the confidentiality of their account credentials.\nNotify [Your Company] immediately of any unauthorized use of your account.",fontSize: 16 ),
             const  SizedBox(height: 20,),
             buildTextStyle("4. Services:",fontSize: 18,isHeading: true,),
             buildTextStyle("The App provides travel-related services, including but not limited to [list specific services].\n[Your Company] reserves the right to modify or discontinue any part of the services without notice.",fontSize: 16),
             const  SizedBox(height: 20,),
             buildTextStyle("5. User Conduct:",fontSize: 18,isHeading: true),
             buildTextStyle("Users agree not to use the App for any unlawful or prohibited purpose.\nUsers shall not interfere with the proper functioning of the App.",fontSize: 16),
             const  SizedBox(height: 20,),
             buildTextStyle("6. Booking and Payments:",fontSize: 18,isHeading: true),
             buildTextStyle("Users are responsible for providing accurate payment information.\n[Your Company] is not responsible for any errors in the booking process.Cancellation and refund policies are [explain your policies].",fontSize: 16),
             const  SizedBox(height: 20,),
             buildTextStyle("7. Intellectual Property:",fontSize: 18,isHeading: true),
             buildTextStyle("All content and materials provided by the App are the property of [Your Company].\nUsers may not reproduce, distribute, or create derivative works without permission.",fontSize: 16),
             const  SizedBox(height: 20,),
             buildTextStyle("8. Privacy Policy:",fontSize: 18,isHeading: true),
             buildTextStyle("The App's Privacy Policy governs the collection and use of user information.\nUsers should review the Privacy Policy to understand how their data is handled.",fontSize: 16),
               const  SizedBox(height: 20,),
               buildTextStyle("9. Disclaimer of Warranties:",fontSize: 18,isHeading: true),
               buildTextStyle("The App is provided 'as is'without any warranties.\n[Your Company] does not guarantee the accuracy or completeness of information provided on the App.",fontSize: 16),
               const  SizedBox(height: 20,),
               buildTextStyle("10. Limitation of Liability:",fontSize: 18,isHeading: true),
               buildTextStyle("- [Your Company] is not liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use of the App.",fontSize: 16),
            ]

          ),
        )

      ),
    );
  }
  Text buildTextStyle(String text, {double fontSize = 18, bool isHeading = false}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: isHeading ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
}