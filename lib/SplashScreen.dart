import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //rebuilds when gets data
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (ctx, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          //to check the sign in state
          if (snapshot.data != null) {
            // if user is signed in
            return HomeScreen();
          } else {
            // if user is not signed in
            return LoginScreen();
          }
        }

        // if user is not signed in
        return LoginScreen();
      },
    );
  }
}
