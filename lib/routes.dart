import 'package:flutter/widgets.dart';
import 'package:testlogin/screens/complete_profile/complete_profile_screen.dart';
import 'package:testlogin/screens/details/details_screen.dart';
import 'package:testlogin/screens/forgot_password/forgot_password_screen.dart';
import 'package:testlogin/screens/home/home_screen.dart';
import 'package:testlogin/screens/login_success/login_success_screen.dart';
import 'package:testlogin/screens/otp/otp_screen.dart';
import 'package:testlogin/screens/profile/profile_screen.dart';
import 'package:testlogin/screens/login/sign_in_screen.dart';
import 'package:testlogin/screens/splash/splash_screen.dart';
import 'package:testlogin/screens/verify_email_view.dart';
import 'package:testlogin/screens/verify_email_view.dart';

import 'screens/login/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  VerifyEmailView.routeName:(context) => VerifyEmailView(),
};
