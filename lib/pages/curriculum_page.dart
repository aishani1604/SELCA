import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selca/pages/components/VideoPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CurriculumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFE8E2D2),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: ListView(children: [
          HeadingWidget(),
          StreakWidget(),
          const SizedBox(height: 10),
          MindfulWidget(),
          RecommendationWidget(),
          GameWidget()
        ])),
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 30.0, 0.0),
        child: Text('Ready to work on your relationship skills?',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Color(0xFF92686C),
                    fontSize: 30,
                    fontWeight: FontWeight.w600))));
  }
}

class StreakWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          width: 160,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFFAF9F6),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.fromLTRB(55, 5, 30, 5),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '5 ',
                style: GoogleFonts.bubblerOne(
                    textStyle: const TextStyle(
                        color: Color(0xFF92686C),
                        fontSize: 40,
                        fontWeight: FontWeight.bold))),
            TextSpan(
                text: 'day   ',
                style: GoogleFonts.bubblerOne(
                    textStyle: const TextStyle(
                  color: Color(0xFF92686C),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ))),
            TextSpan(
                text: 'streak',
                style: GoogleFonts.bubblerOne(
                    textStyle: const TextStyle(
                        color: Color(0xFF92686C),
                        fontSize: 20,
                        fontWeight: FontWeight.w900))),
          ]))),
    ]);
  }
}

class MindfulWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: 90,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => YoutubeVideo(
                        "https://www.youtube.com/watch?v=WP1wxft4j8A")));
          },
          icon: const Icon(Icons.play_arrow_rounded,
              size: 45, color: Color(0xFF92686C)),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF8F4EC),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          label: Text('Tune in for an expert mindfulness session',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0xFF92686C),
                      fontSize: 25,
                      fontWeight: FontWeight.w500))),
        ));
  }
}

class RecommendationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            color: const Color(0xFFF8F4EC),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(children: [
          Row(children: const [
            Icon(Icons.notifications, size: 20, color: Color(0xFF92686C)),
            Text('   Recommendations',
                style: TextStyle(color: Color(0xFF92686C), fontSize: 15)),
          ]),
          const SizedBox(height: 10),
          Text('Dive deeper into different kinds of relationships in your life',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0xFF92686C),
                      fontSize: 25,
                      fontWeight: FontWeight.w500))),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFAF9F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: Text('Parents',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xFF92686C),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))),
                    )),
                const SizedBox(width: 10),
                SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFAF9F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: Text('Friends',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xFF92686C),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))),
                    )),
                const SizedBox(width: 10),
                SizedBox(
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFAF9F6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: Text('Yourself',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xFF92686C),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))),
                    )),
              ])),
        ]));
  }
}

class GameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 155,
        decoration: BoxDecoration(
            color: const Color(0xFFF8F4EC),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(children: [
          Row(children: const [
            Icon(Icons.notifications, size: 20, color: Color(0xFF92686C)),
            Text('   Learn through fun games',
                style: TextStyle(color: Color(0xFF92686C), fontSize: 15)),
          ]),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => WelcomeScreen()),
              // );
            },
            icon: const Icon(Icons.play_circle_filled_rounded,
                size: 45, color: Color(0xFF92686C)),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF8F4EC),
                elevation: 0.0,
                shadowColor: Colors.transparent),
            label: Text('Take a quiz to test your knowledge',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xFF92686C),
                        fontSize: 25,
                        fontWeight: FontWeight.w500))),
          )
        ]));
  }
}
