import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'article_page.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFFE8E2D2),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: signUserOut,
                          icon: Icon(Icons.logout),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  HeadingWidget(),
                  const SizedBox(height: 10),
                  AgeWidget(),
                  const SizedBox(height: 10),
                  ChooseAgeWidget(),
                  const SizedBox(height: 30),
                  SkillWidget(),
                  const SizedBox(height: 10),
                  SkillChoiceWidget(),
                  const SizedBox(height: 10),
                  NextButtonWidget()
                ])),
          ),
        ));
  }
}

class HeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Welcome to Selca!',
        style: GoogleFonts.dancingScript(
            textStyle: const TextStyle(
                color: Color(0xFFA0291D),
                fontSize: 55,
                fontWeight: FontWeight.w900)));
  }
}

class AgeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Please select your age group',
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500)));
  }
}

class ChooseAgeWidget extends StatefulWidget {
  const ChooseAgeWidget({super.key});
  @override
  State<ChooseAgeWidget> createState() => _ChooseAgeWidget();
}

class _ChooseAgeWidget extends State<ChooseAgeWidget> {
  List<String> items = ['4-7', '8-12', '13-17'];
  String dropdownValue = "4-7";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.black, width: 1)),
      //   		color: const Color(0xFFf4dbd7),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: const Text("Age"),
        dropdownColor: Colors.orangeAccent,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue ?? '';
          });
        },
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 33.0),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Which SEL ',
              style: GoogleFonts.bubblerOne(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900))),
          TextSpan(
              text: 'skill',
              style: GoogleFonts.bubblerOne(
                  textStyle: const TextStyle(
                color: Color(0xFFE3705D),
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ))),
          TextSpan(
              text: ' would you like to work on?',
              style: GoogleFonts.bubblerOne(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900))),
        ])));
  }
}

class SkillChoiceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(children: [
      Container(
          height: 85,
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8E2D2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.grey, width: 1.0))),
            child: const Text('Relationship Skills',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          )),
      const SizedBox(height: 10),
      Container(
          height: 85,
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8E2D2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.grey, width: 1.0))),
            child: const Text('Self-Management',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          )),
      const SizedBox(height: 10),
      Container(
          height: 85,
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8E2D2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.grey, width: 1.0))),
            child: const Text('Responsible Decision Making',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          )),
    ]));
  }
}

class NextButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 45,
        margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 20.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArticlePage()),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE3705D),
              shape: const StadiumBorder()),
          child: Text('Next',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600))),
        ));
  }
}
