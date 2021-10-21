import 'package:biguenoexpress/components/pallete.dart';
import 'package:biguenoexpress/screens/add_product/add_product.dart';
import 'package:biguenoexpress/screens/sign_up/sign_up.dart';
import 'package:biguenoexpress/widgets/password_inputfield.dart';
import 'package:biguenoexpress/widgets/rounded_button.dart';
import 'package:biguenoexpress/widgets/text_inputfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatefulWidget {
  static String routeName = "/log_in";
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _loginWithFacebook() async{
    try{

      final facebookLoginResult = await FacebookAuth.instance.login();
      print(facebookLoginResult);
      final userData = await FacebookAuth.instance.getUserData();

      print(facebookLoginResult);

      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken.token);
      var result =await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      print(result.user.uid);
      
      await firestore.collection("Users").doc(result.user.uid).set({
        'email': userData['email'],
        'imgUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      }, SetOptions(merge: true));
    }
    catch(ex){
      print(ex);
    }
  }
  @override
  void initState() {
    super.initState();

  }

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
            children: [
              Flexible(
                child: Center(
                  child: Text(
                  'Bigueño \nExpress',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
              TextInputField(icon: FontAwesomeIcons.envelope, hint: 'Email', inputType: TextInputType.emailAddress, inputAction: TextInputAction.next, color: Colors.grey, iconColor: Colors.white),
              PasswordInputField(icon: FontAwesomeIcons.lock, hint: 'Password', inputType: TextInputType.name, inputAction: TextInputAction.done, ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: kBodyText,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RoundedButton(btnText: 'LOG IN',),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProduct()),
                  );
                },
                child: Text(
                  'OR',
                  style: kBodyText,
                ),
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {
                  _loginWithFacebook();
                },
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text(
                  'Don`t have account? REGISTER',
                  style: kBodyText,
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ],
    );
  }
}

