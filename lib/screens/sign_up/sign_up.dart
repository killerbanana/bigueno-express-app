import 'package:biguenoexpress/components/pallete.dart';
import 'package:biguenoexpress/screens/login/login_screen.dart';
import 'package:biguenoexpress/services/auth.dart';
import 'package:biguenoexpress/widgets/password_inputfield.dart';
import 'package:biguenoexpress/widgets/rounded_button.dart';
import 'package:biguenoexpress/widgets/text_inputfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/img/bg.jpg',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Your Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    color: Colors.grey[400],
                    iconColor: Colors.white),
                PasswordInputField(
                  icon: FontAwesomeIcons.lock,
                  hint: 'Password',
                  inputType: TextInputType.name,
                  myController: TextEditingController(),
                  inputAction:
                  TextInputAction.next, ),
                PasswordInputField(icon: FontAwesomeIcons.lock, hint: 'Confirm Password', inputType: TextInputType.name, inputAction: TextInputAction.done,),
                SizedBox(height: 10,),
                RoundedButton(btnText: 'REGISTER', press: () { }, ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
                  child: Text(
                    'Already have account? SIGN IN',
                    style: kBodyText,
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
        )
      ],
    );
  }
}
