import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF05999E), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 8),
          child: ListView(
            children: [
              buildTextStyle(
                  "This privacy policy has been compiled to better serve those who are concerned with how their 'Personally Identifiable Information' (PII) is being used online. PII, as described in US privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context."),
              buildTextStyle(
                  "Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.What personal information do we collect from the people that visit our blog, website or app?"),
              buildTextStyle(
                  "When ordering or registering on our App/site, as appropriate, you may be asked to enter your email address or other details to help you with your experience."),
              const SizedBox(
                height: 18,
              ),
              buildTextStyle("When do we collect information?",
                  fontSize: 18, isHeading: true),
              const SizedBox(
                height: 10,
              ),
              buildTextStyle(
                  "We collect information from you when you register on our site, place an order or enter information on our site."),
              buildTextStyle(
                  "How do we use your information?We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways:"),
              const SizedBox(
                height: 10,
              ),
              buildTextStyle(
                  "• To personalize your experience and to allow us to deliver the type of content and product offerings in which you are most interested."),
              buildTextStyle(
                  "• To allow us to better service you in responding to your customer service requests."),
              const SizedBox(
                height: 20,
              ),
              buildTextStyle("How do we protect your information?",
                  fontSize: 18, isHeading: true),
              const SizedBox(
                height: 10,
              ),
              buildTextStyle(
                  "Your personal information is contained behind secured networks and is only accessible by a limited number of persons who have special access rights to such systems, and are required to keep the information confidential. In addition, all sensitive/credit information you supply is encrypted via Secure Socket Layer (SSL) technology.We implement a variety of security measures when a user places an order enters, submits, or accesses their information to maintain the safety of your personal information."),
              buildTextStyle(
                  "All transactions are processed through a gateway provider and are not stored or processed on our servers."),
              const SizedBox(
                height: 20,
              ),
              buildTextStyle("Third-party disclosure",
                  isHeading: true, fontSize: 18),
              const SizedBox(
                height: 10,
              ),
              buildTextStyle(
                  "We do not sell, trade, or otherwise transfer to outside parties your Personally Identifiable Information unless we provide users with advance notice. This does not include website hosting partners and other parties who assist us in operating our website, conducting our business, or serving our users, so long as those parties agree to keep this information confidential. We may also release information when it's release is appropriate to comply with the law, enforce our site policies, or protect ours or others' rights, property or safety.However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses."),
            ],
          ),
        ),
      ),
    );
  }

  Text buildTextStyle(String text,
      {double fontSize = 18, bool isHeading = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isHeading ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
