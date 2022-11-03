import 'package:flutter/material.dart';
import 'package:testlogin/routes.dart';
import 'package:testlogin/screens/home/home_screen.dart';
import 'package:testlogin/screens/profile/profile_screen.dart';
import 'package:testlogin/screens/sign_up/components/sign_up_form.dart';
import 'package:testlogin/screens/splash/splash_screen.dart';
import 'package:testlogin/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return  HomeScreen();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return SignUpForm() ;
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
