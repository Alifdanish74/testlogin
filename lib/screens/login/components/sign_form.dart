import 'package:flutter/material.dart';
import 'package:testlogin/components/custom_surfix_icon.dart';
import 'package:testlogin/components/form_error.dart';
import 'package:testlogin/helper/keyboard.dart';
import 'package:testlogin/routes.dart';
import 'package:testlogin/screens/home/home_screen.dart';
import 'package:testlogin/screens/verify_email_view.dart';
import 'package:testlogin/utilities/show_error_dialog.dart';
import 'package:testlogin/screens/forgot_password/forgot_password_screen.dart';
import 'package:testlogin/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../services/auth/auth_exceptions.dart';
import '../../../services/auth/auth_service.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool? remember = false;

  //coding baru from fyp
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  //...............................

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName,
                    (route) => false,
                  );
            },
            style: ButtonStyle(
              // foregroundColor:
              //     MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 255, 136, 54),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              width: size.width * 0.5,
              padding: const EdgeInsets.all(0),
              child: const Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildPasswordFormField() {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter Your Password Here',
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            // validator: (val) =>
            //     val?.length == 6 ? 'Password too short.' : null,
            // onSaved: (val) => _password = val as TextEditingController,
            obscureText: _obscureText,
          ),
          TextButton(
              onPressed: _toggle, child: Text(_obscureText ? "Show" : "Hide"))
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _email,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Enter Your Email Here',
        hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
