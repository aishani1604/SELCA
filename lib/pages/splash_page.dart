import 'package:flutter/material.dart';
import 'package:selca/pages/auth_page.dart';
import 'package:selca/pages/components/my_button.dart';
import 'package:selca/pages/components/my_textfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA0291D),
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(height: 10.0),
          // Logo in the middle
          Image.asset(
            '/Users/keyshiagabriel/SELCA/lib/assets/logo.png',
            width: 800,
            height: 750,
          ),

          // "Get Started" button
          const SizedBox(height: 10.0),
          ElevatedButton(
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFA1733A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AuthPage()),
              );
            },
          ),
        ]),
      ),
    );
  }
}
