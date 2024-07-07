import 'package:flutter/material.dart';
import 'package:calculator/components/drawer.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn googleSignIn;

  const LoginPage({Key? key, required this.googleSignIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerSection(),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/image/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: const Color.fromRGBO(2, 28, 49, 0.75),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: 80,
                height: 80,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/image/avatarone.jpg'),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Center(
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  _signInWithGoogle(context, googleSignIn);
                },
                child: Text("SIGN IN WITH GOOGLE"),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color.fromARGB(253, 134, 15, 170),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to handle Google Sign-In
  void _signInWithGoogle(BuildContext context, GoogleSignIn googleSignIn) async {
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
       
      if (googleUser != null) {
       //kujya kuri homepage
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (error) {
      print('Google Sign-In error: $error');
      // Handling error
    }
  }
}
