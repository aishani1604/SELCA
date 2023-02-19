import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selca/pages/components/my_button.dart';
import 'package:selca/pages/components/my_textfield.dart';
import 'login_or_register_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // check if confirm password != password
    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);
      matchErrorMessage();
      return;
    }
    // try creating the user
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        weakPassErrorMessage();
      } else if (e.code == 'email-already-in-use') {
        emailErrorMessage();
      }
    } catch (e) {
      print(e);
    }
  }

  // weak pass
  void weakPassErrorMessage() {
    showDialog(
        barrierColor: null,
        context: context,
        builder: (context) {
          return const AlertDialog(
            alignment: Alignment(-2.9, 0.22),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(
              child: Text('The password provided is too weak.',
                  style: TextStyle(color: Colors.red, fontSize: 15)),
            ),
          );
        });
  }

  // email error message
  void emailErrorMessage() {
    showDialog(
        barrierColor: null,
        context: context,
        builder: (context) {
          return const AlertDialog(
            alignment: Alignment(-27.0, 0.22),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(
              child: Text('The account already exists for that email.',
                  style: TextStyle(color: Colors.red, fontSize: 15)),
            ),
          );
        });
  }

  // email error message
  void matchErrorMessage() {
    showDialog(
        barrierColor: null,
        context: context,
        builder: (context) {
          return const AlertDialog(
            alignment: Alignment(-2.4, 0.22),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Center(
              child: Text('The passwords do not match.',
                  style: TextStyle(color: Colors.red, fontSize: 15)),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E2D2),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sign Up
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // Sign In
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Have an Account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // sign in button
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
